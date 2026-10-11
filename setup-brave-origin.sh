#!/usr/bin/bash

set -euo pipefail

GIT_DIR="${HOME}/git"
mkdir -p "$GIT_DIR"

REPOS=(
    "git@github.com:r00tk1d/power-tabs.git"
    "git@github.com:r00tk1d/jira-branch-name-generator.git"
    "git@github.com:r00tk1d/mru-tab-switcher.git"
)

for repo in "${REPOS[@]}"; do
    name="$(basename "$repo" .git)"

    if [ -d "$GIT_DIR/$name" ]; then
        echo "  already present:    $name (skipping)"
        continue
    fi

    echo "  cloning:            $name"
    git clone "$repo" "$GIT_DIR/$name"
done

