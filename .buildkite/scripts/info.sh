#!/bin/bash

# e	Exit script immediately if any command returns a non-zero exit status.
# u	Exit script immediately if an undefined variable is used (for example, echo "$UNDEFINED_ENV_VAR").
# o pipefail	Ensure Bash pipelines (for example, cmd | othercmd) return a non-zero status if any of the commands fail, rather than returning the exit status of the last command in the pipeline.
set -euo pipefail

source ./scripts/config.sh
source ./.buildkite/scripts/common.sh

print "git:"
echo "   branch: $BUILDKITE_BRANCH"
echo "   commit: $BUILDKITE_COMMIT"
echo "   checkout path: $BUILDKITE_BUILD_CHECKOUT_PATH"
echo "   author name: $BUILDKITE_BUILD_AUTHOR"
echo "   author email: $BUILDKITE_BUILD_AUTHOR_EMAIL"

echo ""
print "pull request:"
echo "   number: $BUILDKITE_PULL_REQUEST"
echo "   base branch: $BUILDKITE_PULL_REQUEST_BASE_BRANCH"
echo "   draft: $BUILDKITE_PULL_REQUEST_DRAFT"
echo "   repo: $BUILDKITE_PULL_REQUEST_REPO"

echo ""
print "build: "
echo "   id: $BUILDKITE_BUILD_ID"
echo "   number: $BUILDKITE_BUILD_NUMBER"
echo "   path: $BUILDKITE_BUILD_PATH"
echo "   url: $BUILDKITE_BUILD_URL"
echo "   command: $BUILDKITE_COMMAND"
echo "   tag: $BUILDKITE_TAG"

echo ""
print "artifacts: "
echo "   paths: $BUILDKITE_ARTIFACT_PATHS"
echo "   upload desitnation: $BUILDKITE_ARTIFACT_UPLOAD_DESTINATION"

echo ""
print "github: "
echo "   deployment id: $BUILDKITE_GITHUB_DEPLOYMENT_ID"
echo "   deployment env: $BUILDKITE_GITHUB_DEPLOYMENT_ENVIRONMENT"
echo "   task: $BUILDKITE_GITHUB_DEPLOYMENT_TASK"
echo "   payload: $BUILDKITE_GITHUB_DEPLOYMENT_PAYLOAD"

echo ""
print "service: "
echo "   name: $SERVICE_NAME"
