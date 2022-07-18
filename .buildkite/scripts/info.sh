#!/bin/bash
set -o errexit

echo "git: "
echo "   branch: $BUILDKITE_BRANCH"
echo "   commit: $BUILDKITE_COMMIT"
echo "   checkout path: $BUILDKITE_BUILD_CHECKOUT_PATH"
echo "   author name: $BUILDKITE_BUILD_AUTHOR"
echo "   author email: $BUILDKITE_BUILD_AUTHOR_EMAIL"

echo ""
echo "pull request:"
echo "   number: $BUILDKITE_PULL_REQUEST"
echo "   base branch: $BUILDKITE_PULL_REQUEST_BASE_BRANCH"
echo "   draft: $BUILDKITE_PULL_REQUEST_DRAFT"
echo "   repo: $BUILDKITE_PULL_REQUEST_REPO"

echo ""
echo "build: "
echo "   id: $BUILDKITE_BUILD_ID"
echo "   number: $BUILDKITE_BUILD_NUMBER"
echo "   path: $BUILDKITE_BUILD_PATH"
echo "   url: $BUILDKITE_BUILD_URL"
echo "   command: $BUILDKITE_COMMAND"
echo "   tag: $BUILDKITE_TAG"

echo ""
echo "artifacts: "
echo "   paths: $BUILDKITE_ARTIFACT_PATHS"
echo "   upload desitnation: $BUILDKITE_ARTIFACT_UPLOAD_DESTINATION"

echo ""
echo "github: "
echo "   deployment id: $BUILDKITE_GITHUB_DEPLOYMENT_ID"
echo "   deployment env: $BUILDKITE_GITHUB_DEPLOYMENT_ENVIRONMENT"
echo "   task: $BUILDKITE_GITHUB_DEPLOYMENT_TASK"
echo "   payload: $BUILDKITE_GITHUB_DEPLOYMENT_PAYLOAD"
