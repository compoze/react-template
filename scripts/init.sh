#!/usr/bin/env bash

set -eo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_DIR="$SCRIPT_DIR/.."

echo "installing dependencies"
npm ci
echo "building component"
npm run build
echo "provisioning dev site"
npm run provision dev
echo "deploying dev site"
npm run deploy dev

echo "provisioning stage site"
npm run provision stage
echo "deploying stage site"
npm run deploy stage

echo "provisioning prod site"
npm run provision prod
echo "deploying prod site"
npm run deploy prod
