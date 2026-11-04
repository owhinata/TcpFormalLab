#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")/.."
jar="$PWD/.tools/tla2tools-1.7.2.jar"
test -f "$jar" || { echo 'TLC 未導入: ./scripts/setup.sh' >&2; exit 1; }
echo '=== 正常モデル ==='
(cd tla/client && timeout 120s java -cp "$jar" tlc2.TLC -cleanup -workers 1 -config Client.cfg Client.tla)
