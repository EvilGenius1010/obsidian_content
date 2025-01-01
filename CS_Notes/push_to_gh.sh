#!/bin/bash

# Define folder names and paths as arrays
path_folder_names=("CS_Notes")
paths=(
  "C:/Users/91860/Desktop/Harshu/projects/obsidian_notes/notes"
)

# Create a temporary directory to merge the vaults
temp_dir=$(mktemp -d)

# Merge the vaults into the temporary directory
for i in "${!paths[@]}"; do
  dest_dir="$temp_dir/${path_folder_names[$i]}"
  mkdir -p "$dest_dir"  # Create the destination directory
  cp -r "${paths[$i]}"/* "$dest_dir"  # Copy contents into the directory
done

echo "Vaults copied to temporary directory."

# Copy the .git directory (if it exists)
if [ -d ".git" ]; then
  cp -r .git "$temp_dir"
  echo ".git directory copied."
else
  echo "No .git directory found; skipping."
fi

# Change to the temporary directory
cd "$temp_dir" || exit

# Initialize git if not already initialized
if [ ! -d ".git" ]; then
  git init
  echo "Initialized a new Git repository."
fi

# Add all files and commit
git add -A
git commit -m "Merged Obsidian Vaults"

# Create windows_1 branch
git checkout -b windows_1

# Push to the remote repository
remote_url="https://github.com/EvilGenius1010/obsidian_content.git"
git remote add origin "$remote_url" 2>/dev/null || echo "Remote already exists."
git push -u origin windows_1 --force

# Clean up the temporary directory
rm -rf "$temp_dir"

echo "Vaults merged and pushed to GitHub successfully!"
