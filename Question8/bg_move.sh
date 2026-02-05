# Check argument
if [ "$#" -ne 1 ]; then
    echo "Usage: ./bg_move.sh <directory_path>"
    exit 1
fi

dir="$1"

# Check directory exists
if [ ! -d "$dir" ]; then
    echo "Error: Directory not found"
    exit 1
fi

# Create backup directory
mkdir -p "$dir/backup"

echo "Parent script PID: $$"

# Move files in background
for file in "$dir"/*
do
    if [ -f "$file" ]; then
        mv "$file" "$dir/backup/" &
        echo "Moved $(basename "$file") in background, PID: $!"
    fi
done

# Wait for all background processes
wait
echo "All background move operations completed."
