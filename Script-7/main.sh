#!/bin/bash

Your_github_username=" "

echo "Give me your GitHub username"
read $YO

# Add all changes to the staging area
git add --all

# Prompt for a commit message
echo "Enter your commit message:"
read commit_message

# Commit the changes with the provided message
git commit -m "$commit_message"

#We push our changes
git push
echo "$Your_github_username"

echo "Changes have been committed with the message: '$commit_message'"

