#!/bin/bash

if [ ! -f "marks.txt" ]; then
    echo "Error: marks.txt file not found."
    exit 1
fi

one_fail_count=0
all_pass_count=0

echo "Students who failed in exactly ONE subject:"
echo "-----------------------------------------"

while IFS=',' read -r roll name m1 m2 m3
do
    # Clean inputs (remove spaces and CR characters)
    m1=$(echo "$m1" | tr -d ' \r')
    m2=$(echo "$m2" | tr -d ' \r')
    m3=$(echo "$m3" | tr -d ' \r')

    fail_count=0

    if (( m1 < 33 )); then
        ((fail_count++))
    fi
    if (( m2 < 33 )); then
        ((fail_count++))
    fi
    if (( m3 < 33 )); then
        ((fail_count++))
    fi

    if (( fail_count == 1 )); then
        echo "$roll, $name"
        ((one_fail_count++))
    fi

    if (( fail_count == 0 )); then
        ((all_pass_count++))
    fi

done < marks.txt

echo
echo "Students who passed in ALL subjects:"
echo "----------------------------------"

while IFS=',' read -r roll name m1 m2 m3
do
    m1=$(echo "$m1" | tr -d ' \r')
    m2=$(echo "$m2" | tr -d ' \r')
    m3=$(echo "$m3" | tr -d ' \r')

    if (( m1 >= 33 && m2 >= 33 && m3 >= 33 )); then
        echo "$roll, $name"
    fi
done < marks.txt

echo
echo "Summary:"
echo "--------"
echo "Students failed in exactly one subject: $one_fail_count"
echo "Students passed in all subjects: $all_pass_count"
