#!/usr/bin/bash

set -euo pipefail

POLICY_DIR="/etc/brave/policies/managed"
POLICY_FILE="${POLICY_DIR}/extensions.json"

UPDATE_URL="https://clients2.google.com/service/update2/crx"

# Chrome Web Store extension IDs
KEEPASSXC_BROWSER_ID="oboonakemofpalcgghocfoadofidjkkk"
VIMIUM_C_ID="hfjbmagddngcpeloejdejnfgbamkjaeg"

# cloning my plugins into ~/git
GIT_DIR="${HOME}/git"

REPOS=(
    "git@github.com:r00tk1d/power-tabs.git"
    "git@github.com:r00tk1d/jira-branch-name-generator.git"
    "git@github.com:r00tk1d/mru-tab-switcher.git"
)

echo "Cloning into ${GIT_DIR}..."

# These repos are cloned via SSH, so verify SSH is set up before attempting.
if [[ ! -f "${HOME}/.ssh/id_ed25519" && ! -f "${HOME}/.ssh/id_rsa" ]]; then
    echo "No SSH key found in ${HOME}/.ssh" >&2
    echo "Generate one with:  ssh-keygen -t ed25519 -C \"$(whoami)@$(hostname)\"" >&2
    echo "Then add the public key to GitHub:  https://github.com/settings/ssh/new" >&2
    exit 1
fi

echo "Testing SSH authentication to GitHub..."
if ! ssh -o BatchMode=yes -o StrictHostKeyChecking=accept-new -T git@github.com 2>/dev/null; then
    echo "WARNING: Could not authenticate to GitHub over SSH." >&2
    echo "         The SSH key may not be registered, or the agent is not running." >&2
    echo "         Add your key to GitHub or start ssh-agent and run ssh-add." >&2
    exit 1
fi

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

# Brave only reads policies from /etc/brave/policies/managed
# (per-user ~/.config/brave/policies is NOT supported).
if [[ "$EUID" -ne 0 && ! -w "$POLICY_DIR" ]]; then
    echo "Run this script with sudo:"
    echo "  sudo $0"
    exit 1
fi

# Uninstall
if [[ "${1:-}" == "uninstall" ]]; then
    echo "Removing Brave extension policy..."

    if [[ -f "$POLICY_FILE" ]]; then
        rm "$POLICY_FILE"
        echo "Removed: $POLICY_FILE"
    else
        echo "Policy file does not exist: $POLICY_FILE"
    fi

    echo
    echo "Done."
    echo
    echo "Restart Brave to remove the policy-installed extensions."
    echo
    echo "Then verify at:"
    echo "  brave://policy"

    exit 0
fi

echo "Creating Brave policy directory..."
mkdir -p "$POLICY_DIR"

echo "Configuring KeePassXC Browser and Vimium C..."

# normal_installed: auto-installs; users can only disable (not uninstall) in the browser.
cat > "$POLICY_FILE" <<EOF
{
  "ExtensionSettings": {
    "${KEEPASSXC_BROWSER_ID}": {
      "installation_mode": "normal_installed",
      "update_url": "${UPDATE_URL}"
    },
    "${VIMIUM_C_ID}": {
      "installation_mode": "normal_installed",
      "update_url": "${UPDATE_URL}"
    }
  }
}
EOF

chmod 0644 "$POLICY_FILE"

echo
echo "Done."
echo

echo "Installed extensions:"
echo "  KeePassXC Browser"
echo "  Vimium C"
echo

echo "Policy:"
cat "$POLICY_FILE"

echo
echo "Restart Brave, then verify at:"
echo "  brave://policy"

echo
echo "Policy-installed extensions cannot be uninstalled in the browser;"
echo "users can only disable them at:"
echo "  brave://extensions"
echo
echo "To remove the policy (and the extensions) instead:"
echo "  sudo $0 uninstall"