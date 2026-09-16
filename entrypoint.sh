#!/bin/bash

# echo "==================="

# git config --global user.name "${GITHUB_ACTOR}"
# git config --global user.mail "${INPUT_EMAIL}"
# git config --global --add safe.directory /github/workspace

# python3 usr/bon/feed.py

# git add . && git commit -m "Update Feed" 

# git push --set-upstream origin main

# echo "==================="



echo "==================="

git config --global user.name "${GITHUB_ACTOR}"
git config --global user.email "${INPUT_EMAIL}"
git config --global --add safe.directory /github/workspace

python3 /usr/bin/feed.py

git add -A && git commit -m "Update Feed"
git push --set-upstream origin main

echo "==================="
