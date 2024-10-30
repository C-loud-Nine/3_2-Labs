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
[ ! -d "txt" ] && mkdir "txt"
[ ! -d "docs" ] && mkdir "docs"

# Create 10 random files with .txt and .docs extensions
for i in {1..10}; do
    # Generate a random file name
    filename="file_$((RANDOM % 1000))"
    
    # Randomly assign an extension (.txt or .docs)
    if (( RANDOM % 2 == 0 )); then
        touch "${filename}.txt"
    else
        touch "${filename}.docs"
    fi
done

# Move .txt files to the 'txt' directory and .docs files to the 'docs' directory
for file in *; do
    if [[ $file == *.txt ]]; then
        mv "$file" txt/
    elif [[ $file == *.docs ]]; then
        mv "$file" docs/
    fi
done

echo "Random files created and moved to their respective directories."
