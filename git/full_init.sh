#!/bin/sh

# Pass as argument the path to the project root directory!

cd $1

git init

# Add empty '.gitkeep' files in every empty directory:
find . -type d -empty -not -path "./.git/*" -exec touch {}/.gitkeep \;

# Files to ignore:
echo *.o >> .gitignore
echo *.a >> .gitignore
echo exec >> .gitignore

git add -A && git commit -m "Initial commit"
