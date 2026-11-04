#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")/.."
export ELAN_HOME="$PWD/.tools/elan" PATH="$PWD/.tools/elan/bin:$PATH"
if rg -n '\b(sorry|admit)\b' lean/TcpFormalLab lean/TcpFormalLab.lean; then echo '未完の証明があります' >&2; exit 1; fi
cd lean
timeout 120s lake build
