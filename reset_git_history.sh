#!/bin/bash
# Description: Reset Git history to a single commit on branch main

BRANCH_NAME="main"
COMMIT_MESSAGE="Initial commit"
RANDOM_STRING=$(date | md5sum | head -c 10)

git checkout --orphan temp_branch_$RANDOM_STRING
git add -A
git commit -m "$COMMIT_MESSAGE"
git branch -D $BRANCH_NAME
git branch -m $BRANCH_NAME
git push --force origin $BRANCH_NAME