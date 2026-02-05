#!/bin/bash

# Check if both directories exist
if [ ! -d "dirA" ] || [ ! -d "dirB" ]; then
    echo "Error: dirA and/or dirB does not exist."
    exit 1
fi

echo "Files present only in dirA:"
echo "---------------------------"
comm -23 <(ls dirA | sort) <(ls dirB | sort)

echo
echo "Files present only in dirB:"
echo "---------------------------"
comm -13 <(ls dirA | sort) <(ls dirB | sort)

echo
echo "Files present in BOTH directories with content comparison:"
echo "----------------------------------------------------------"

for file in $(comm -12 <(ls dirA | sort) <(ls dirB | sort))
do
    if cmp -s "dirA/$file" "dirB/$file"; then
        echo "$file : SAME content"
    else
        echo "$file : DIFFERENT content"
    fi
done
