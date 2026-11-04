#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")/.."
jar="$PWD/.tools/tla2tools-1.7.2.jar"
test -f "$jar" || { echo "TLC 未導入: ./scripts/setup.sh" >&2; exit 1; }
echo '=== 不正モデル: Terminal 違反を期待 ==='
log=$(mktemp)
trap 'rm -f "$log"' EXIT
set +e
(cd tla/broken-models && timeout 120s java -cp "$jar" tlc2.TLC -cleanup -workers 1 -config BrokenClient.cfg BrokenClient.tla) >"$log" 2>&1
status=$?
set -e
cat "$log"
if [[ $status -ne 12 ]] || ! grep -q 'Invariant Terminal is violated' "$log"; then
  echo "期待する不変条件違反ではありません (exit=$status)" >&2; exit 1
fi
