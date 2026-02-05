#!/bin/bash

# Check input file
if [ "$#" -ne 1 ]; then
    echo "Usage: ./patterns.sh <input_file>"
    exit 1
fi

file="$1"

if [ ! -f "$file" ]; then
    echo "Error: File not found"
    exit 1
fi

# Clear output files
> vowels.txt
> consonants.txt
> mixed.txt

# Convert to lowercase, one word per line
tr -c 'a-zA-Z' '\n' < "$file" | tr 'A-Z' 'a-z' | while read word
do
    [ -z "$word" ] && continue

    if [[ "$word" =~ ^[aeiou]+$ ]]; then
        echo "$word" >> vowels.txt

    elif [[ "$word" =~ ^[bcdfghjklmnpqrstvwxyz]+$ ]]; then
        echo "$word" >> consonants.txt

    elif [[ "$word" =~ ^[bcdfghjklmnpqrstvwxyz][a-z]*$ ]] && \
         [[ "$word" =~ [aeiou] ]] && \
         [[ "$word" =~ [bcdfghjklmnpqrstvwxyz] ]]; then
        echo "$word" >> mixed.txt
    fi
done

