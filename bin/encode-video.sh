#!/usr/bin/env bash
set -euo pipefail

INPUT_DIR="${1:-.}"

OUTPUT_DIR="${INPUT_DIR%/}/converted"
mkdir -p "$OUTPUT_DIR"

# Safe globs for "for" loops: no match expands to zero words.
shopt -s nullglob

echo "↩️ Encode videos..."
for file in "$INPUT_DIR"/*.mp4 "$INPUT_DIR"/*.MP4; do
  [ -f "$file" ] || continue

  base="$(basename "$file")"

  case "$base" in
    *_encoded.mp4|*_encoded.MP4)
      echo ">> Skip already encoded: $base"
      continue
      ;;
  esac

  out="$OUTPUT_DIR/${base%.*}_encoded.mp4"

  if [[ -f "$out" ]]; then
    echo ">> Output exists, skip: $out"
    continue
  fi

  echo ">> Encoding: $base → $(basename "$out")"

  ffmpeg -i "$file" \
    -map 0:v:0 -map 0:a:0 -map_metadata 0 \
    -c:v libx265 -preset slow -crf 23 \
    -tag:v hvc1 -pix_fmt yuv420p \
    -c:a copy \
    -movflags +faststart \
    "$out"

  echo ">> Encoded: $out"
  echo
done

# .LRF files are low resolution files safe to remove.
echo "↩️ Clean up .LRF files..."
for lrf_file in "$INPUT_DIR"/*.LRF; do
  [ -f "$lrf_file" ] || continue

  rm -f "$lrf_file"

  echo ">> Removed: $(basename "$lrf_file")"
done

echo "✅ Done"
