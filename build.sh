#!/bin/bash
set -euo pipefail

APP_NAME="Kyoto"
BUILD_DIR=".build"
BUNDLE_DIR="${BUILD_DIR}/${APP_NAME}.app"
CONTENTS_DIR="${BUNDLE_DIR}/Contents"
MACOS_DIR="${CONTENTS_DIR}/MacOS"

echo "Building ${APP_NAME}..."
swift build -c release 2>&1

echo "Assembling .app bundle..."
rm -rf "${BUNDLE_DIR}"
mkdir -p "${MACOS_DIR}"

cp "${BUILD_DIR}/release/${APP_NAME}" "${MACOS_DIR}/${APP_NAME}"
cp "Resources/Info.plist" "${CONTENTS_DIR}/Info.plist"

echo "Code signing..."
codesign --force --sign - \
    --entitlements Resources/Kyoto.entitlements \
    "${BUNDLE_DIR}"

echo ""
echo "Built: ${BUNDLE_DIR}"
echo "Run:   open ${BUNDLE_DIR}"
