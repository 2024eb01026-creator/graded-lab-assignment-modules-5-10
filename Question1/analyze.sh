#!/bin/bash

# Check if exactly one argument is provided
if [ "$#" -ne 1 ]; then
    echo "Error: Please provide exactly one argument."
    exit 1
fi

path="$1"

# Check if path exists
if [ ! -e "$path" ]; then
    echo "Error: The specified path does not exist."
    exit 1
fi

# If argument is a file
if [ -f "$path" ]; then
    echo "Argument is a file."
    wc "$path"

# If argument is a directory
elif [ -d "$path" ]; then
    echo "Argument is a directory."

    total_files=$(find "$path" -type f | wc -l)
    txt_files=$(find "$path" -type f -name "*.txt" | wc -l)

    echo "Total number of files: $total_files"
    echo "Number of .txt files: $txt_files"

else
    echo "Error: Unsupported file type."
fi

