#!/bin/bash

# Check if Git is installed
command -v git >/dev/null 2>&1 || { echo >&2 "git is required but not found"; exit 1; }

# Get current directory
current_dir=$(pwd)

# Stage all changes
git add -A

# Get current timestamp for commit message
timestamp=$(date +"%Y-%m-%d %H:%M:%S")

# Commit changes with timestamp
git commit -m "Automated commit: $timestamp"

# Push changes to origin
git push -u origin --force

echo "Git add, commit, and push successful."
