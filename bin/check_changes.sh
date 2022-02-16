#!/bin/bash
set -e

ENV=$1
REGION=$2

if [[ "$BRANCH_NAME" == "main" ]] ; then
  # shellcheck disable=SC1083
  DIFF=$(git diff --name-only --diff-filter=d "$PREV_SHA" "$SHA")
else
  DIFF=$(git diff --name-only --diff-filter=d origin/main HEAD)
fi

echo -e "Git diff :\n${DIFF}"
# shellcheck disable=SC2196
if ! echo "${DIFF}" | egrep -q "^infrastructure/${ENV}/${REGION}"; then
  export CHANGED=false
else
  export CHANGED=true
fi