#!/bin/bash

# Add all modified files
git add .

# Commit with the message provided as an argument
git commit -m "$1"
