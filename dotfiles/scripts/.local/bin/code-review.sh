#!/bin/bash
# Usage: ./code-review.sh

set -e

DEFAULT_BASE="develop"
BASE_BRANCH="$DEFAULT_BASE"

git fetch --all --prune

# Determine BASE BRANCH (MR into BASE BRANCH)
read -p "Use '$DEFAULT_BASE' as the base branch? [Y/n] " CONFIRM
CONFIRM=${CONFIRM:-y}

if [[ ! "$CONFIRM" =~ ^[Yy]$ ]]; then
  BASE_BRANCH=$(git for-each-ref refs/heads --format='%(refname:short)' | fzf --height 10 --prompt="base branch> " --ansi)
  if [ -z "$BASE_BRANCH" ]; then
    echo "❌ No base branch selected."
    exit 1
  fi
fi
echo "👉 Selected base branch: $BASE_BRANCH"

#Determine BRANCH for code review
BRANCH=$(git for-each-ref refs/heads refs/remotes --format='%(refname:short)' \
  | grep -vx "^$BASE_BRANCH\$" \
  | fzf --height 10 --prompt="cr branch> " --ansi)

if [ -z "$BRANCH" ]; then
  echo "❌ No CR branch selected."
  exit 1
fi

echo "👉 Selected cr branch: $BRANCH"


# Determine if the selected BRANCH is a remote branch
if [[ "$BRANCH" == origin/* ]]; then
  LOCAL_BRANCH="${BRANCH#origin/}"
  
  if git show-ref --verify --quiet "refs/heads/$LOCAL_BRANCH"; then
    echo "📦 Local branch '$LOCAL_BRANCH' already exists. Switching to it."
    git checkout "$LOCAL_BRANCH"
  else
    echo "📦 Creating local tracking branch '$LOCAL_BRANCH' from '$BRANCH'"
    git checkout -b "$LOCAL_BRANCH" "$BRANCH"
  fi

  BRANCH="$LOCAL_BRANCH"
else
  git checkout "$BRANCH"
fi


echo "Finding fork point between '$BASE_BRANCH' and '$BRANCH'"
FORK_POINT=$(git merge-base --fork-point "$BASE_BRANCH" "$BRANCH" 2>/dev/null || git merge-base "$BASE_BRANCH" "$BRANCH")

if [ -z "$FORK_POINT" ]; then
  echo "❌ Could not determine fork point."
  exit 1
fi

echo "Getting first commit unique to $BRANCH"
FIRST_COMMIT=$(git rev-list --reverse "$FORK_POINT"..HEAD | head -n 1)

if [ -z "$FIRST_COMMIT" ]; then
  echo "❌ No unique commits found on branch."
  exit 1
fi

echo "Soft resetting branch to parent of first commit ($FIRST_COMMIT)"
git reset --soft "${FIRST_COMMIT}^"

echo "✅ Done. Branch $BRANCH is now soft reset to its start (base: $BASE_BRANCH)."

printf "\nAfter review and changes, run:\n\ngit reset --mixed ORIG_HEAD\n\n"
