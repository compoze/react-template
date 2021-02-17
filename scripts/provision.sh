#!/usr/bin/env bash

set -eo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_DIR="$SCRIPT_DIR/.."

BUCKET_NAME=$1
PROJECT_NAME=$2
ENV=$3

echo "Creating website in bucket ${BUCKET_NAME} for ${PROJECT_NAME} and environment ${ENV}"
##package the site yaml file
aws cloudformation package --template-file "$PROJECT_DIR/cloudformation/website.yaml" \
--output-template-file s3-output.yml --s3-bucket "${BUCKET_NAME}"

##deploy site 
aws cloudformation deploy --template-file s3-output.yml --stack-name "${PROJECT_NAME}-website-${ENV}" \
--parameter-overrides BucketName="${BUCKET_NAME}.${ENV}" --no-fail-on-empty-changeset