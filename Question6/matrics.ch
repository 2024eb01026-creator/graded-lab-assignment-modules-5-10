
#!/bin/bash

FILE="input.txt"

# Convert text to lowercase and split into one word per line
WORDS=$(tr -c 'A-Za-z' '\n' < "$FILE" | tr 'A-Z' 'a-z')

# Longest word
LONGEST=$(echo "$WORDS" | awk '{print length, $0}' | sort -n | tail -1 | awk '{print $2}')

# Shortest word
SHORTEST=$(echo "$WORDS" | awk '{print length, $0}' | sort -n | head -1 | awk '{print $2}')

# Average word length
AVG=$(echo "$WORDS" | awk '{sum+=length; count++} END {print sum/count}')

# Total number of unique words
UNIQUE=$(echo "$WORDS" | sort | uniq | wc -l)

# Display results
echo "Longest word: $LONGEST"
echo "Shortest word: $SHORTEST"
echo "Average word length: $AVG"
echo "Total unique words: $UNIQUE"
