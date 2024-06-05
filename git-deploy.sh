
#!/bin/sh

# Add all modified files
git add .

# Commit with the message provided as an argument
git commit -m "$1"

# Ask for confirmation before pushing
read -p "Pull 'main' and Push the changes to the remote repository? (y/n) " -n 1 -r
echo    

if [[ $REPLY =~ ^[Yy]$ ]]
then
    # Update the current branch with the main branch from the remote
    git pull origin main 

    # Push the changes to the current branch
    git push
else
    echo "Push cancelled."
fi

