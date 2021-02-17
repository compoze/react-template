#!/usr/bin/env bash

set -eo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_DIR="$SCRIPT_DIR/.."


BUCKET_NAME=$1
ENV=$2

S3_URL="s3://${BUCKET_NAME}.${ENV}"
echo "Deploying website to ${S3_URL}"

aws s3 sync --delete ./build "$S3_URL"