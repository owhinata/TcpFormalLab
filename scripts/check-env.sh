#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")/.."
dotnet --version
java -version
if [[ -x .tools/elan/bin/elan ]]; then
  export ELAN_HOME="$PWD/.tools/elan" PATH="$PWD/.tools/elan/bin:$PATH"
  (cd lean && lean --version && lake --version)
else echo 'Lean/elan 未導入: ./scripts/setup.sh' >&2; exit 1; fi
if [[ -f .tools/tla2tools-1.7.2.jar ]]; then
  echo '7f21faa2cdae3189e7d5fadb4488f0dfcc658407  .tools/tla2tools-1.7.2.jar' | sha1sum -c -
else echo 'TLC 未導入: ./scripts/setup.sh' >&2; exit 1; fi
