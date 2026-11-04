#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")/.."
export ELAN_HOME="$PWD/.tools/elan" PATH="$PWD/.tools/elan/bin:$PATH"
if grep -R -nE --include='*.lean' '(^|[^[:alnum:]_])(sorry|admit)([^[:alnum:]_]|$)' lean/TcpFormalLab lean/TcpFormalLab.lean; then
  echo '未完の証明があります' >&2
  exit 1
else
  status=$?
  if [[ $status -ne 1 ]]; then
    echo "Lean ソースの検索に失敗しました (exit=$status)" >&2
    exit 1
  fi
fi
cd lean
timeout 120s lake build
