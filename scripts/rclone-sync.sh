#!/bin/bash

SOURCE_DIR="/workspace/ComfyUI/output"
DEST_DIR="/Chicfitique/output"
SCRIPT_DIR="$(dirname "${BASH_SOURCE[0]}")"
RANDOM_DIR_FILE="$SCRIPT_DIR/random_dir.txt"

# Check if the random directory file exists, otherwise create it
if [ ! -f "$RANDOM_DIR_FILE" ]; then
    RANDOM_DIR="$(openssl rand -hex 6)"
    echo "$RANDOM_DIR" > "$RANDOM_DIR_FILE"
else
    RANDOM_DIR=$(cat "$RANDOM_DIR_FILE")
fi

FULL_DEST_DIR="$DEST_DIR/$RANDOM_DIR"

# Initial rclone copy of all files
rclone copy "$SOURCE_DIR" "gdrive:$FULL_DEST_DIR" --ignore-existing

# Loop to continuously watch the directory
while true; do
    inotifywait -e close_write "$SOURCE_DIR"
    rclone copy "$SOURCE_DIR" "gdrive:$FULL_DEST_DIR" --ignore-existing
done
