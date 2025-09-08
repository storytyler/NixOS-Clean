#!/bin/bash
# Master script to load all agent API keys into the environment.

# Get the directory where this script is located
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

source "$DIR/gemini_keys.sh"
source "$DIR/qwen_keys.sh"
source "$DIR/claude_keys.sh"

echo "All agent API keys have been loaded into your shell environment."
