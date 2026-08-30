#!/bin/bash

set -euo pipefail

# cloning git repos into ~/git
GIT_DIR="${HOME}/git"

REPOS=(
    "git@github.com:r00tk1d/power-tabs.git"
    "git@github.com:r00tk1d/jira-branch-name-generator.git"
    "git@github.com:r00tk1d/mru-tab-switcher.git"
)

echo "Cloning into ${GIT_DIR}..."

mkdir -p "$GIT_DIR"

for repo in "${REPOS[@]}"; do
    name="$(basename "$repo" .git)"

    if [ -d "$GIT_DIR/$name" ]; then
        echo "  already present:    $name (skipping)"
        continue
    fi

    echo "  cloning:            $name"
    if ! git clone "$repo" "$GIT_DIR/$name"; then
        echo "  FAILED to clone:   $repo" >&2
        exit 1
    fi
done

echo
echo "Done. Cloned into ${GIT_DIR}:"
ls -1 "$GIT_DIR"