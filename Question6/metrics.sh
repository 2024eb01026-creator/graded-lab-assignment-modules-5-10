#!/bin/bash

# Check if input file exists
if [ ! -f "input.txt" ]; then
    echo "Error: input.txt not found"
    exit 1
fi

# Convert text to one word per line (lowercase, remove punctuation)
words=$(tr -c 'a-zA-Z' '\n' < input.txt | tr 'A-Z' 'a-z' | grep -v '^$')

# Longest word
longest=$(echo "$words" | awk '{ if (length($0) > max) { max = length($0); word = $0 } } END { print word }')

# Shortest word
shortest=$(echo "$words" | awk 'NR==1 { min = length($0); word = $0 } { if (length($0) < min) { min = length($0); word = $0 } } END { print word }')

# Average word length
avg=$(echo "$words" | awk '{ total += length($0); count++ } END { printf "%.2f\n", total/count }')

# Unique word count
unique=$(echo "$words" | sort | uniq | wc -l)

echo "Longest word: $longest"
echo "Shortest word: $shortest"
echo "Average word length: $avg"
echo "Total unique words: $unique"
