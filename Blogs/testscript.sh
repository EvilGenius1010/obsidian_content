#!/bin/bash

# Define the paths to your Obsidian vaults
vaults=(
  "/Users/harshavardhankolhatkar04/Desktop/Projects/CS Notes/"
  "/Users/harshavardhankolhatkar04/Desktop/Chess/Chess Notes/"
  "/Users/harshavardhankolhatkar04/Desktop/Projects/Cohort/web3/web3 notes/"
  "/Users/harshavardhankolhatkar04/Desktop/Projects/blog content/blogs/"
  # Add more vault paths here
)

#Define hash table which has folder name and path
declare path_folder_names=("CS_Notes" "Chess_Notes" "Web3_Notes" "Blogs")
declare paths=(
"/Users/harshavardhankolhatkar04/Desktop/Projects/CS Notes/"
"/Users/harshavardhankolhatkar04/Desktop/Chess/Chess Notes/"
"/Users/harshavardhankolhatkar04/Desktop/Projects/Cohort/web3/web3 notes/"
"/Users/harshavardhankolhatkar04/Desktop/Projects/blog content/blogs/"

)

# Create a temporary directory to merge the vaults
temp_dir=$(mktemp -d)

# Merge the vaults into the temporary directory
for i in "${!paths[@]}"; do

  echo "path names $path_folder_names"
  echo "path ${paths[$i]}"*
  echo "$temp_dir"/"$path_folder_names"
done