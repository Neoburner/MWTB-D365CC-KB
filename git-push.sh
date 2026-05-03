#!/bin/bash
# git-push.sh
# Use this from the sandbox instead of raw git commands.
# Routes GIT_INDEX_FILE to /tmp to avoid stale .git/index.lock errors
# caused by the Cowork sandbox mount restrictions.
#
# Usage: bash git-push.sh "your commit message"

set -e

REPO_DIR="$(cd "$(dirname "$0")" && pwd)"
export GIT_INDEX_FILE=/tmp/kb-git-index

cd "$REPO_DIR"
git read-tree HEAD
git add -A
git commit -m "${1:-chore: update kb}"
git push
