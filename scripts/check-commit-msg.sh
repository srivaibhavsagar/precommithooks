#!/bin/bash

commit_msg_file=$1
commit_msg=$(head -n1 "$commit_msg_file")

# Define your allowed prefixes
allowed_types="feat|fix|docs|style|refactor|test|chore"

if ! echo "$commit_msg" | grep -Eq "^(${allowed_types}): .+"; then
  echo "❌ Invalid commit message!"
  echo "✅ Format must be: <type>: <message>, e.g., 'feat: add user login'"
  echo "Allowed types: $allowed_types"
  exit 1
fi