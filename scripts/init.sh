#!/usr/bin/env bash

set -eo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_DIR="$SCRIPT_DIR/.."

yarn install --frozen-lockfile && npm run build && npm run provision dev && npm run provision stage && npm run provision prod