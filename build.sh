#!/usr/bin/env bash
set -euo pipefail

rm -rf build
mkdir -p build
cd build
emcmake cmake -GNinja -DCMAKE_BUILD_TYPE=Release ../third_party/xmutil
ninja
em++ -o xmutil.wasm -Os -g3 -fwasm-exceptions -DNDEBUG --no-entry -s PURE_WASI=1 -s STRICT=1 -s ASSERTIONS=0 -s DYNAMIC_EXECUTION=0 -s STANDALONE_WASM=1 -s FILESYSTEM=0 -s NO_RELOCATABLE -s EXPORTED_FUNCTIONS='["_free", "_malloc", "_xmutil_convert_mdl_to_xmile", "_xmutil_get_log", "_xmutil_clear_log"]' -s EXPORTED_RUNTIME_METHODS='[]' libxmutil.a libutf.a libtinyxml2.a

cp xmutil.wasm ../src/
