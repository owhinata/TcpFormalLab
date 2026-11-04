#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")/.."
timeout 120s dotnet test TcpFormalLab.slnx -m:1
