#!/bin/bash

# Navigate to the home directory and then to Desktop
cd ~ || exit
cd Desktop || exit

# Create folder named 'cse 3202' if it doesn't already exist
if [ ! -d "cse 3202" ]; then
    mkdir "cse 3202"
fi

# Navigate into the 'cse 3202' folder
cd "cse 3202" || exit

# Create directories 'txt' and 'docs' if they don't exist
if [ ! -d "txt" ]; then
    mkdir "txt"
fi

if [ ! -d "docs" ]; then
    mkdir "docs"
fi

# Prompt user for input and save it to the appropriate file based on extension
echo "Enter the extension (.txt or .docs): "
read -r extension

case "$extension" in
    .txt)
        echo "Write the content for the .txt file:"
        read -r text
        echo "$text" > "txt/file.txt"
        echo "Content saved to txt/file.txt"
        ;;
    .docs)
        echo "Write the content for the .docs file:"
        read -r text
        echo "$text" > "docs/file.docs"
        echo "Content saved to docs/file.docs"
        ;;
    *)
        echo "Invalid extension. Please enter either .txt or .docs."
        ;;
esac
