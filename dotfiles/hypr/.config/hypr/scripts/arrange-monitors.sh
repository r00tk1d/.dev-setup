#!/usr/bin/env bash
# Keep external monitors on the left and the internal laptop panel on the right.
# Externals are laid out left-to-right (sorted by name), then the internal panel
# is placed immediately to their right. Re-runs on monitor hotplug and config reload.

set -euo pipefail

arrange() {
  local plan
  plan=$(hyprctl -j monitors 2>/dev/null | jq -r '
    def lw: ((if (.transform == 1 or .transform == 3) then .height else .width end) / .scale | . + 0.5 | floor);
    map(. + {lw: lw})
    | (map(select(.name | test("^(eDP|LVDS)-") | not)) | sort_by(.name))
      + (map(select(.name | test("^(eDP|LVDS)-"))))
    | .[]
    | [.name, (.lw | tostring), (.x | tostring), (.y | tostring), (.scale | tostring)] | @tsv
  ') || return 0
  [[ -z $plan ]] && return 0

  local x=0 name lw cx cy scale
  while IFS=$'\t' read -r name lw cx cy scale; do
    [[ -z $name ]] && continue
    if [[ $cx != "$x" || $cy != "0" ]]; then
      hyprctl eval "hl.monitor({ output = \"${name}\", mode = \"preferred\", position = \"${x}x0\", scale = ${scale} })" >/dev/null
    fi
    x=$(( x + lw ))
  done <<<"$plan"
}

arrange

SOCK="${XDG_RUNTIME_DIR}/hypr/${HYPRLAND_INSTANCE_SIGNATURE}/.socket2.sock"
[[ -S $SOCK ]] || exit 0

socat -U - "UNIX-CONNECT:${SOCK}" | while read -r line; do
  case "${line%%>>*}" in
    monitoradded|monitoraddedv2|monitorremoved|monitorremovedv2|configreloaded) arrange ;;
  esac
done
