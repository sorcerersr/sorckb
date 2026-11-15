#!/usr/bin/env bash
#
# Export one STL per keycap block (toprow/homerow/bottomrow/thumbs) via
# OpenSCAD. Prefers the OpenSCAD flatpak, falls back to system `openscad`.
#
# Outputs keycaps_{toprow,homerow,bottomrow,thumbs}.stl next to this script.
#
# Usage:
#   ./export_stls.sh              # generate (skips up-to-date STLs)
#   ./export_stls.sh --force      # ignore mtime check, re-export everything
#   OPENSAPP_ID=... ./export_stls.sh   # explicit flatpak app id
#
# An STL is re-exported if it is older than keycaps.scad.
#
# If flatpak cannot see this directory ("cannot open file"), run once:
#   flatpak override --user --filesystem=host <app-id>
set -euo pipefail
cd "$(dirname "$0")"

FORCE=0
[[ "${1:-}" == "--force" ]] && FORCE=1

# --- backend: flatpak first, then system openscad ---
APP_ID=""
if command -v flatpak >/dev/null 2>&1; then
    app_list=$(flatpak list --app --columns=application 2>/dev/null || true)
    # -m1: stop after first match (avoids SIGPIPE from piping into head under pipefail)
    APP_ID="${OPENSAPP_ID:-$(grep -im1 openscad <<< "$app_list" || true)}"
fi
if [[ -z $APP_ID ]] && ! command -v openscad >/dev/null 2>&1; then
    echo "error: no OpenSCAD found (neither flatpak nor system); set OPENSAPP_ID or install openscad" >&2
    exit 1
fi

run_openscad() {
    if [[ -n $APP_ID ]]; then
        # Pin the format: all existing OpenSCAD exports in this repo are ASCII
        # STL, and newer OpenSCAD defaults to binary.
        flatpak run "$APP_ID" --export-format=asciistl "$@"
    else
        openscad "$@"
    fi
}
if [[ -n $APP_ID ]]; then
    echo "using flatpak $APP_ID" >&2
else
    echo "using system openscad" >&2
fi

FONT_ROW='"Hack Nerd Font Mono:style=Bold"'
FONT_THUMB='"DejaVu Sans:style=Bold"'
# Note: -D string values must include the quotes in the argument itself.

blocks=(toprow homerow bottomrow thumbs)
for b in "${blocks[@]}"; do
    if [[ $b == thumbs ]]; then font=$FONT_THUMB; else font=$FONT_ROW; fi
    dst="keycaps_$b.stl"
    if [[ $FORCE -eq 0 && -f $dst && $dst -nt keycaps.scad ]]; then
        echo "skip  $dst (up to date)"
        continue
    fi
    start=$SECONDS
    run_openscad -Dblock="\"$b\"" -Dfontname="$font" -o "$dst" keycaps.scad
    echo "ok    $dst  ($((SECONDS-start))s)"
done

echo
ls -lh keycaps_*.stl
