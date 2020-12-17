#!/usr/bin/env bash
set -euo pipefail

rm -rf build
mkdir -p build
cd build
emcmake cmake -GNinja -DCMAKE_BUILD_TYPE=Release ../third_party/xmutil
ninja
em++ -o xmutil.js -O0 -s MODULARIZE=1 -s 'EXPORT_NAME="createModule"' -s EXPORTED_FUNCTIONS='["__convert_mdl_to_xmile"]' -s EXPORTED_RUNTIME_METHODS='["ccall","cwrap"]' libxmutil.a libutf.a libtinyxml2.a

cp xmutil.js ../src/
cp xmutil.wasm ../src/
