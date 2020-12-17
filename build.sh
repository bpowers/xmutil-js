#!/usr/bin/env bash
set -euo pipefail

rm -rf build
mkdir -p build
cd build
emcmake cmake -GNinja -DCMAKE_BUILD_TYPE=Release ../third_party/xmutil
ninja
em++ -o xmutil.wasm -Os --no-entry -s STANDALONE_WASM -s FILESYSTEM=0 -s MODULARIZE=1 -s 'EXPORT_NAME="createModule"' -s EXPORTED_FUNCTIONS='["_free", "_malloc", "__convert_mdl_to_xmile"]' -s EXPORTED_RUNTIME_METHODS='["ccall","cwrap"]' libxmutil.a libutf.a libtinyxml2.a

cp xmutil.wasm ../src/
