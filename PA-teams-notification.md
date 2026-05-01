# Power Automate → Teams Notification: KB Feature Alerts

**Purpose:** When the Cowork `d365cc-feature-monitor` task finds and documents new D365 CC features, it POSTs a JSON payload directly to a Power Automate HTTP trigger. PA formats it into a rich Adaptive Card and posts it to your Teams channel.

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
    "date":               { "type": "string" },
    "new_feature_count":  { "type": "integer" },
    "repo_url":           { "type": "string" },
    "features": {
      "type": "array",
      "items": {
        "type": "object",
        "properties": {
          "name":     { "type": "string" },
          "category": { "type": "string" },
          "emoji":    { "type": "string" },
          "url":      { "type": "string" },
          "summary":  { "type": "string" }
        }
      }
    }
  }
}
```

Save the trigger. PA generates the **HTTP POST URL**. The PA trigger URL is already wired into the SKILL.md.

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
- Value (type this into the expression editor):

```
@{concat(items('Loop_features')?['emoji'], ' **[', items('Loop_features')?['name'], '](', items('Loop_features')?['url'], ')**', '\n', items('Loop_features')?['category'], '\n_', items('Loop_features')?['summary'], '_')}
```

This produces one block per feature, e.g.:
> `✨ **[Agent Assist Suggestions](https://github.com/...)**`
> `05-copilot-and-ai`
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
- **Adaptive Card:** paste the full JSON from Part 2 below

---

## Part 2 — Adaptive Card JSON

Paste this in full into the Teams action's Adaptive Card field.

```json
{
  "type": "AdaptiveCard",
  "version": "1.5",
  "$schema": "http://adaptivecards.io/schemas/adaptive-card.json",
  "body": [
    {
      "type": "Container",
      "style": "accent",
      "bleed": true,
      "items": [
        {
          "type": "ColumnSet",
          "columns": [
            {
              "type": "Column",
              "width": "auto",
              "verticalContentAlignment": "Center",
              "items": [
                {
                  "type": "Image",
                  "url": "https://img-prod-cms-rt-microsoft-com.akamaized.net/cms/api/am/imageFileData/RE4OBTl",
                  "size": "Medium",
                  "style": "Default",
                  "altText": "Dynamics 365 Contact Center"
                }
              ]
            },
            {
              "type": "Column",
              "width": "stretch",
              "verticalContentAlignment": "Center",
              "items": [
                {
                  "type": "TextBlock",
                  "text": "📚 D365 Contact Center KB",
                  "weight": "Bolder",
                  "size": "Large",
                  "color": "Light",
                  "wrap": true
                },
                {
                  "type": "TextBlock",
                  "text": "✅ New feature docs landed",
                  "size": "Small",
                  "color": "Light",
                  "spacing": "None"
                }
              ]
            }
          ]
        }
      ]
    },
    {
      "type": "Container",
      "style": "emphasis",
      "spacing": "None",
      "items": [
        {
          "type": "ColumnSet",
          "columns": [
            {
              "type": "Column",
              "width": "stretch",
              "items": [
                {
                  "type": "TextBlock",
                  "text": "🗓️  @{triggerBody()?['date']}",
                  "size": "Small",
                  "isSubtle": true
                }
              ]
            },
            {
              "type": "Column",
              "width": "auto",
              "items": [
                {
                  "type": "TextBlock",
                  "text": "📄  @{triggerBody()?['new_feature_count']} new doc(s)",
                  "size": "Small",
                  "weight": "Bolder",
                  "horizontalAlignment": "Right",
                  "color": "Accent"
                }
              ]
            }
          ]
        }
      ]
    },
    {
      "type": "Container",
      "spacing": "Medium",
      "separator": true,
      "items": [
        {
          "type": "TextBlock",
          "text": "**What landed**",
          "size": "Medium",
          "weight": "Bolder"
        },
        {
          "type": "TextBlock",
          "text": "@{outputs('DocListText')}",
          "wrap": true,
          "spacing": "Small"
        }
      ]
    }
  ],
  "actions": [
    {
      "type": "Action.OpenUrl",
      "title": "📖  Open Knowledge Base",
      "url": "@{triggerBody()?['repo_url']}",
      "style": "positive"
    },
    {
      "type": "Action.OpenUrl",
      "title": "🆕  What's New",
      "url": "@{concat(triggerBody()?['repo_url'], '/blob/main/README.md')}",
      "style": "default"
    }
  ]
}
```

> **Note on the header image:** The image URL points to a Microsoft CDN asset. If it stops rendering, swap in any publicly accessible PNG — e.g. your company logo or the Microsoft Dynamics 365 icon from their partner portal. The card degrades gracefully if the image 404s.

---

## What the card looks like

```
┌──────────────────────────────────────────────────────┐
│  [D365 icon]  📚 D365 Contact Center KB              │  ← accent (blue)
│               ✅ New feature docs landed              │
├──────────────────────────────────────────────────────┤
│  🗓️ 2026-05-01              📄 2 new doc(s)          │  ← emphasis (grey)
├──────────────────────────────────────────────────────┤
│  What landed                                         │
│                                                      │
│  ✨ Agent Assist Suggestions          (linked)       │
│  05-copilot-and-ai                                   │
│  Real-time suggestions surfaced during calls         │
│                                                      │
│  🧠 Autonomous Case Resolution        (linked)       │
│  06-ai-agents                                        │
│  AI agent that resolves cases end-to-end             │
├──────────────────────────────────────────────────────┤
│  [📖 Open Knowledge Base]  [🆕 What's New]          │
└──────────────────────────────────────────────────────┘
```

---

## Known Gotchas

- **PA HTTP trigger URL contains a SAS token** — treat it as a secret. It lives only in the SKILL.md (not committed to the public repo).
- **Adaptive Card markdown links** — Teams renders `[text](url)` in TextBlocks with `wrap: true`. If links appear as plain text, open the card in the [Adaptive Cards Designer](https://adaptivecards.io/designer/) and verify.
- **`try/except` in the Cowork POST** — a PA error or timeout won't abort the KB run. Check the PA run history in make.powerautomate.com if cards stop appearing.
- **PA free plan** allows 6,000 runs/day. Each KB monitor run = one PA run. No concern.
