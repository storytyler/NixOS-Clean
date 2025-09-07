#!/bin/bash

# Read Claude Code context from stdin
input=$(cat)

# Extract information from JSON
model_name=$(echo "$input" | jq -r '.model.display_name // "Claude"')
current_dir=$(echo "$input" | jq -r '.workspace.current_dir // "."')
output_style=$(echo "$input" | jq -r '.output_style.name // "default"')

# Get basic system info
user=$(whoami)
hostname=$(hostname -s)
basename_dir=$(basename "$current_dir")

# Get git status if in a git repository
git_info=""
if git -C "$current_dir" rev-parse --git-dir >/dev/null 2>&1; then
    # Get current branch
    branch=$(git -C "$current_dir" branch --show-current 2>/dev/null || echo "detached")
    
    # Get status indicators
    status=""
    if ! git -C "$current_dir" diff-index --quiet HEAD -- 2>/dev/null; then
        status="${status}*"  # Modified files
    fi
    if [ -n "$(git -C "$current_dir" ls-files --others --exclude-standard 2>/dev/null)" ]; then
        status="${status}?"  # Untracked files
    fi
    
    git_info=" (${branch}${status})"
fi

# Build the status line with colors
printf "\033[2m%s@%s:%s%s | %s [%s]\033[0m" \
    "$user" \
    "$hostname" \
    "$basename_dir" \
    "$git_info" \
    "$model_name" \
    "$output_style"