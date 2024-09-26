#!/bin/bash

# Function to display usage
usage() {
    echo "Usage: $0 [-m MODEL] [-b BRANCH]"
    echo "  -m MODEL   Specify the Ollama model to use (default: default-model)"
    echo "  -b BRANCH  Specify the Git branch to fetch commits from (default: current branch)"
    exit 1
}

# Default values
OLLAMA_MODEL="llama3.1"  # Replace with your desired default Ollama model
BRANCH=$(git rev-parse --abbrev-ref HEAD)

# Parse command-line options
while getopts ":m:b:h" opt; do
    case ${opt} in
        m )
            OLLAMA_MODEL=$OPTARG
            ;;
        b )
            BRANCH=$OPTARG
            ;;
        h )
            usage
            ;;
        \? )
            echo "Invalid Option: -$OPTARG" 1>&2
            usage
            ;;
        : )
            echo "Invalid Option: -$OPTARG requires an argument" 1>&2
            usage
            ;;
    esac
done
shift $((OPTIND -1))

# Check if the current directory is a Git repository
if ! git rev-parse --is-inside-work-tree > /dev/null 2>&1; then
    echo "Error: This directory is not a Git repository."
    exit 1
fi

# Fetch the three most recent commit messages
COMMIT_MESSAGES=$(git log -n 3 --pretty=format:"%h - %s (%an, %ar)" "$BRANCH")

if [ -z "$COMMIT_MESSAGES" ]; then
    echo "No commits found in branch '$BRANCH'."
    exit 0
fi

echo "The three most recent commit messages in branch '$BRANCH' are:"
echo "$COMMIT_MESSAGES"
echo ""

# Send the commit messages to Ollama
# Replace 'ollama run <model>' with the actual Ollama command you intend to use
# For example, if you want to generate a summary or perform some analysis

# Example: Generate a summary of the commits
ollama run "$OLLAMA_MODEL" --prompt "Here are the three most recent Git commit messages:\n\n$COMMIT_MESSAGES\n\nPlease provide a summary of these commits."

# Optional: Capture Ollama's response
# RESPONSE=$(ollama run "$OLLAMA_MODEL" --prompt "Here are the three most recent Git commit messages:\n\n$COMMIT_MESSAGES\n\nPlease provide a summary of these commits.")
# echo "Ollama's Summary:"
# echo "$RESPONSE"
