#!/bin/bash

SOURCE_DIR="/workspace/ComfyUI/output"
DEST_DIR="/Chicfitique/output/$(openssl rand -hex 6)"

inotifywait -m -e close_write,moved_to,create "$SOURCE_DIR" |
rclone copy "$SOURCE_DIR" "$DEST_DIR" --ignore-existing
