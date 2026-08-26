#!/usr/bin/env bash
#
# Generate the four klasa case-half STLs (top/bottom x left/right) via the
# OpenSCAD flatpak (nightly).
#
# Outputs to stl/case_{top,bottom}_{left,right}.stl next to this script.
#
# Usage:
#   ./export_stls.sh              # generate (skips up-to-date STLs)
#   ./export_stls.sh --force      # ignore mtime check, re-export everything
#   OPENSAPP_ID=... ./export_stls.sh   # explicit flatpak app id
#
# An STL is re-exported if it is older than any of its SCAD dependencies
# (the wrapper plus case/switches/controller/screwinsert.scad).
#
# If flatpak cannot see this directory ("cannot open file"), run once:
#   flatpak override --user --filesystem=host <app-id>
set -euo pipefail
cd "$(dirname "$0")"

FORCE=0
[[ "${1:-}" == "--force" ]] && FORCE=1

app_list=$(flatpak list --app --columns=application 2>/dev/null || true)
# -m1: stop after first match (avoids SIGPIPE from piping into head under pipefail)
APP_ID="${OPENSAPP_ID:-$(grep -im1 openscad <<< "$app_list" || true)}"
if [[ -z $APP_ID ]]; then
    echo "error: no OpenSCAD flatpak found; set OPENSAPP_ID (check: flatpak list --app | grep -i openscad)" >&2
    exit 1
fi

OUT=stl
mkdir -p "$OUT"
# Pin the format: all existing OpenSCAD exports in this repo are ASCII STL,
# and binary is planned as the future default, so be explicit.
# Tuning further: nightly uses -O format/key=value (list keys with:
#   flatpak run <app-id> --help-export)
EXPORT_FLAGS=(--export-format=asciistl)
EXTRA_FLAGS=()

parts=(case_top_left case_top_right case_bottom_left case_bottom_right)
# everything that feeds the four wrappers
deps=(case.scad switches.scad controller.scad screwinsert.scad)

for part in "${parts[@]}"; do
    src="$part.scad"
    dst="$OUT/$part.stl"
    if [[ $FORCE -eq 0 && -f $dst ]]; then
        stale=0
        for dep in "$src" "${deps[@]}"; do
            if ! [[ $dst -nt $dep ]]; then
                stale=1
                break
            fi
        done
        if [[ $stale -eq 0 ]]; then
            echo "skip  $dst (up to date)"
            continue
        fi
    fi
    start=$SECONDS
    flatpak run "$APP_ID" "${EXPORT_FLAGS[@]}" "${EXTRA_FLAGS[@]}" -o "$dst" "$src"
    echo "ok    $dst  ($((SECONDS-start))s)"
done

echo
ls -lh "$OUT"/*.stl
