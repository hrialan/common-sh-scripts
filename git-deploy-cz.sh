
#!/bin/sh

# Add all modified files
git add .

# Check pre-commits
pre-commit run
if [ $? -ne 0 ]; then
    echo "Pre-commit checks failed. Please fix the issues and try again."
    exit 1
fi

# Commit with Commitizen
cz commit
if [ $? -ne 0 ]; then
    echo "Commitizen commit failed. Please check the error messages and try again."
    exit 1
fi

# Ask for confirmation before pulling and pushing
read -p "Pull 'main' and push the changes to the remote repository? (y/n) " -n 1 -r
echo

if [[ $REPLY =~ ^[Yy]$ ]]; then
    # Update the current branch with the main branch from the remote
    git pull origin main
    if [ $? -ne 0 ]; then
        echo "Failed to pull from 'main'. Please resolve any conflicts and try again."
        exit 1
    fi
    
    # Push the changes to the current branch
    git push
    if [ $? -ne 0 ]; then
        echo "Failed to push the changes. Please check the error messages and try again."
        exit 1
    fi
else
    echo "Push cancelled."
fi

