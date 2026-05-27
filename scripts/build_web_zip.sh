#!/usr/bin/env bash
set -euo pipefail

# Build Flutter web release and zip the output into dist/web.zip

ROOT_DIR="$(cd "$(dirname "$0")/.." && pwd)"
cd "$ROOT_DIR"

echo "Building Flutter web release..."
command -v flutter >/dev/null 2>&1 || { echo "flutter not found in PATH"; exit 1; }

flutter pub get
flutter build web --release

WEB_BUILD_DIR="$ROOT_DIR/build/web"
if [ ! -d "$WEB_BUILD_DIR" ]; then
  echo "Web build output not found at $WEB_BUILD_DIR"
  exit 1
fi

OUT_DIR="$ROOT_DIR/dist"
mkdir -p "$OUT_DIR"
ZIP_PATH="$OUT_DIR/web.zip"

echo "Creating zip $ZIP_PATH ..."
( 
  cd "$WEB_BUILD_DIR"
  zip -r "$ZIP_PATH" . -x "*.DS_Store"
)

echo "Done. Output: $ZIP_PATH"
