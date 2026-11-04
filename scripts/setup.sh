#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")/.."
mkdir -p .tools
if [[ ! -f .tools/tla2tools-1.7.2.jar ]]; then
  curl -fL https://github.com/tlaplus/tlaplus/releases/download/v1.7.2/tla2tools.jar -o .tools/tla2tools-1.7.2.jar.tmp
  echo '7f21faa2cdae3189e7d5fadb4488f0dfcc658407  .tools/tla2tools-1.7.2.jar.tmp' | sha1sum -c -
  mv .tools/tla2tools-1.7.2.jar.tmp .tools/tla2tools-1.7.2.jar
fi
export ELAN_HOME="$PWD/.tools/elan"
if [[ ! -x "$ELAN_HOME/bin/elan" ]]; then
  [[ "$(uname -s)-$(uname -m)" == "Linux-x86_64" ]] || { echo 'elan 自動導入は Linux x86_64 のみ対応' >&2; exit 1; }
  curl -fL https://github.com/leanprover/elan/releases/download/v4.2.4/elan-x86_64-unknown-linux-gnu.tar.gz -o .tools/elan-4.2.4.tar.gz
  echo '42b94d4244e8353142c456ec0e4ca6528fd898a6c604d4059f494e706e431f63  .tools/elan-4.2.4.tar.gz' | sha256sum -c -
  mkdir -p .tools/elan-installer
  tar -xzf .tools/elan-4.2.4.tar.gz -C .tools/elan-installer
  .tools/elan-installer/elan-init -y --no-modify-path --default-toolchain none
fi
"$ELAN_HOME/bin/elan" toolchain install leanprover/lean4:v4.35.0
