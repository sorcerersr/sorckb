#!/usr/bin/env bash
#
# Export one STL per keycap via OpenSCAD (36 caps in
# stl/{toprow,homerow,bottomrow,thumbs}/). Prefers the OpenSCAD flatpak,
# falls back to system `openscad`.
#
# Usage:
#   ./export_stls.sh              # generate (skips up-to-date STLs)
#   ./export_stls.sh --force      # ignore mtime check, re-export everything
#   OPENSAPP_ID=... ./export_stls.sh   # explicit flatpak app id
#
# A cap STL is re-exported if it is older than caps.scad or capslibrary.scad.
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

# Cap names per block. Order MUST match cap_list() in caps.scad
# (toprow 0-9, homerow 10-19, bottomrow 20-29, thumbs 30-35).
declare -A caps=(
    [toprow]="q w e r t y u i o p"
    [homerow]="a s d f g h j k l colon"
    [bottomrow]="z x c v b n m less greater question"
    [thumbs]="shift backspace tab enter space sym"
)
blocks=(toprow homerow bottomrow thumbs)

# Guard against name-table / caps.scad drift: a mismatch would give a cap
# the wrong filename.
for b in "${blocks[@]}"; do
    n=$(wc -w <<< "${caps[$b]}")
    if [[ $b == thumbs && $n -ne 6 ]] || [[ $b != thumbs && $n -ne 10 ]]; then
        echo "error: name table for $b has $n entries, expected $([[ $b == thumbs ]] && echo 6 || echo 10)" >&2
        exit 1
    fi
done

total=0
idx=0
for b in "${blocks[@]}"; do
    mkdir -p "stl/$b"
    for name in ${caps[$b]}; do
        dst="stl/$b/$name.stl"
        total=$((total+1))
        if [[ $FORCE -eq 0 && -f $dst && $dst -nt caps.scad && $dst -nt capslibrary.scad ]]; then
            echo "skip  $dst (up to date)"
        else
            start=$SECONDS
            run_openscad -Dcap_index="$idx" -o "$dst" caps.scad
            echo "ok    $dst  ($((SECONDS-start))s)"
        fi
        idx=$((idx+1))
    done
done

if [[ $total -ne 36 ]]; then
    echo "error: expected 36 caps, got $total" >&2
    exit 1
fi

echo
echo "exported $total caps"
ls -lhR stl/
