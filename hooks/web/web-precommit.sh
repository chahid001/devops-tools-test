#!/bin/bash
set -e

# Run pre-commit using the nested config, but ONLY for the staged files
echo "🔁 Running nested pre-commit config for web project..."

# Get only the staged files that match web files
FILES=$(git diff --cached --name-only --diff-filter=ACM | grep -E '\.js$|\.jsx$|\.json$' || true)

if [ -z "$FILES" ]; then
  echo "✅ No web-related files staged. Skipping web precommit."
  exit 0
fi

pre-commit run --config ./.pre-commit-config.yaml --files $FILES
