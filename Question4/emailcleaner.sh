#!/bin/bash

# Check if emails.txt exists
if [ ! -f "emails.txt" ]; then
    echo "Error: emails.txt file not found."
    exit 1
fi

# Extract valid email addresses
grep -E '^[a-zA-Z0-9]+@[a-zA-Z]+\.com$' emails.txt | sort | uniq > valid.txt

# Extract invalid email addresses
grep -vE '^[a-zA-Z0-9]+@[a-zA-Z]+\.com$' emails.txt > invalid.txt

echo "Valid emails stored in valid.txt"
echo "Invalid emails stored in invalid.txt"
