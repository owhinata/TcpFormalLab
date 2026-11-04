#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")/.."
./scripts/check-env.sh
./scripts/test-csharp.sh
./scripts/check-tla.sh
./scripts/check-lean.sh
