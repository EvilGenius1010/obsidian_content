#!/bin/bash

# Define folder names and paths as arrays
path_folder_names=("CS_Notes" "Chess_Notes" "Web3_Notes" "Blogs")
paths=(
  "/Users/harshavardhankolhatkar04/Desktop/Projects/CS Notes/"
  "/Users/harshavardhankolhatkar04/Desktop/Chess/Chess Notes/"
  "/Users/harshavardhankolhatkar04/Desktop/Projects/Cohort/web3/web3 notes/"
  "/Users/harshavardhankolhatkar04/Desktop/Projects/blog content/blogs/"
)

# Create a temporary directory to merge the vaults
temp_dir=$(mktemp -d)

# Merge the vaults into the temporary directory
for i in "${!paths[@]}"; do
  dest_dir="$temp_dir/${path_folder_names[$i]}"
  mkdir -p "$dest_dir"  # Create the destination directory
  cp -r "${paths[$i]}"* "$dest_dir"  # Copy contents into the directory
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

# Push to the remote repository
remote_url="https://github.com/EvilGenius1010/obsidian_content.git"
git remote add origin "$remote_url" 2>/dev/null
git push -u origin main --force

# Clean up the temporary directory
rm -rf "$temp_dir"

echo "Vaults merged and pushed to GitHub successfully!"
