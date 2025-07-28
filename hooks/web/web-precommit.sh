#!/bin/bash
set -e

# Run pre-commit using the nested config, but ONLY for the staged files
echo "🔁 Running nested pre-commit config for web project..."

pre-commit run --config ./.pre-commit-config.yaml
