# Power Automate → Teams Notification: KB Feature Alerts

**Purpose:** When the Cowork `d365cc-feature-monitor` task finds and documents new D365 CC features, it POSTs a JSON payload directly to a Power Automate HTTP trigger. PA formats that into a rich Adaptive Card and posts it to your Teams channel.

No GitHub webhook involved — Cowork fires the POST itself at the end of each run, the same way it calls Pushover.

---

## Architecture

```
Cowork task (d365cc-feature-monitor)
       │
       │  python3 POST  (JSON payload)
       ▼
[PA: HTTP Request trigger]
       │
  [Parse JSON]
       │
  [Build doc list text]
       │
  [Post Adaptive Card → Teams channel]
```

---

## Part 1 — Power Automate Flow

### Step 1: Create the flow

1. Go to [make.powerautomate.com](https://make.powerautomate.com)
2. **New flow → Instant cloud flow → Skip** (you'll set the trigger manually)
3. Search for trigger: **"When a HTTP request is received"** (no premium licence needed)
4. Name it: `D365-KB-Feature-Alert`

---

### Step 2: Configure the HTTP trigger

In the trigger, paste this JSON schema into **"Request Body JSON Schema"**:

```json
{
  "type": "object",
  "properties": {
    "date": { "type": "string" },
    "new_feature_count": { "type": "integer" },
    "repo_url": { "type": "string" },
    "features": {
      "type": "array",
      "items": {
        "type": "object",
        "properties": {
          "name":     { "type": "string" },
          "category": { "type": "string" },
          "url":      { "type": "string" },
          "summary":  { "type": "string" }
        }
      }
    }
  }
}
```

Save the trigger. PA generates the **HTTP POST URL** — copy it. This is what goes into `[YOUR_PA_HTTP_TRIGGER_URL]` in the SKILL.md.

---

### Step 3: Initialize a variable

Add **Initialize variable**:

| Field | Value |
|-------|-------|
| Name  | `docLines` |
| Type  | Array |
| Value | `[]` |

---

### Step 4: Loop through features and build doc lines

Add **Apply to each** — value: `triggerBody()?['features']`

Name this loop `Loop_features`.

Inside, add **Append to array variable**:
- Variable: `docLines`
- Value:
```
@{concat('• **', items('Loop_features')?['category'], '** → [', items('Loop_features')?['name'], '](', items('Loop_features')?['url'], ')  \n_', items('Loop_features')?['summary'], '_')}
```

This builds one formatted line per feature, e.g.:
> `• **05-copilot-and-ai** → [Agent Assist Suggestions](https://github.com/...)  `
> `_Real-time suggestions surfaced to agents during active conversations_`

---

### Step 5: Compose the doc list

After the loop, add **Compose** — name it `DocListText`:

```
@{join(variables('docLines'), '\n\n')}
```

---

### Step 6: Post Adaptive Card to Teams

Add action: **Microsoft Teams → Post card in a chat or channel**

- **Post as:** Flow bot
- **Post in:** Channel
- **Team / Channel:** select yours
- **Adaptive Card:** paste the JSON below

---

## Part 2 — Adaptive Card JSON

Paste this in full into the Teams action's Adaptive Card field. The `@{...}` expressions resolve at runtime from the PA dynamic content.

```json
{
  "type": "AdaptiveCard",
  "version": "1.4",
  "$schema": "http://adaptivecards.io/schemas/adaptive-card.json",
  "body": [
    {
      "type": "Container",
      "style": "emphasis",
      "bleed": true,
      "items": [
        {
          "type": "TextBlock",
          "text": "D365 Contact Center — Knowledge Base",
          "weight": "Bolder",
          "size": "Medium"
        },
        {
          "type": "TextBlock",
          "text": "New feature docs added",
          "spacing": "None",
          "isSubtle": true
        }
      ]
    },
    {
      "type": "FactSet",
      "facts": [
        {
          "title": "Date",
          "value": "@{triggerBody()?['date']}"
        },
        {
          "title": "New docs",
          "value": "@{triggerBody()?['new_feature_count']}"
        }
      ]
    },
    {
      "type": "TextBlock",
      "text": "**Documents added:**",
      "wrap": true,
      "spacing": "Medium"
    },
    {
      "type": "TextBlock",
      "text": "@{outputs('DocListText')}",
      "wrap": true,
      "spacing": "Small"
    }
  ],
  "actions": [
    {
      "type": "Action.OpenUrl",
      "title": "View KB on GitHub",
      "url": "@{triggerBody()?['repo_url']}"
    }
  ]
}
```

---

## Part 3 — Wire it into the Cowork task

Once your PA flow is saved and you have the trigger URL:

1. Open `/Users/neoburner/Documents/Claude/Scheduled/d365cc-feature-monitor/SKILL.md`
2. In Step 9, replace `[YOUR_PA_HTTP_TRIGGER_URL]` with the URL from PA
3. Save — that's it. Next time the monitor runs and finds something, the Teams card fires automatically

---

## What the Teams card looks like

```
┌─────────────────────────────────────────────────┐
│ D365 Contact Center — Knowledge Base            │
│ New feature docs added                          │
├─────────────────────────────────────────────────┤
│ Date      2026-05-01                            │
│ New docs  2                                     │
├─────────────────────────────────────────────────┤
│ Documents added:                                │
│                                                 │
│ • 05-copilot-and-ai → Agent Assist Suggestions  │
│   Real-time suggestions surfaced during calls   │
│                                                 │
│ • 06-ai-agents → Autonomous Case Resolution     │
│   AI agent that resolves cases end-to-end       │
├─────────────────────────────────────────────────┤
│ [View KB on GitHub]                             │
└─────────────────────────────────────────────────┘
```

---

## Known Gotchas

- **PA HTTP trigger URL contains a SAS token** — treat it as a secret. Don't commit it to the public repo; it lives only in the SKILL.md (which isn't in the repo).
- **Adaptive Card markdown links** — Teams renders `[text](url)` in TextBlocks with `wrap: true`. If links appear as plain text, switch to one `Action.OpenUrl` button per doc as a fallback.
- **`try/except` in the Cowork POST** — a PA error or timeout won't abort the KB run. Check the PA run history if cards stop appearing.
- **PA free plan** allows 6,000 runs/day. Each KB monitor run = one PA run. No concern.
