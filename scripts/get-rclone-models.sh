#!/bin/bash

SOURCE_DIR="${RCLONE_IMPORT_SOURCE_DIR:-/models}"

rclone copy "gdrive:$SOURCE_DIR" /workspace/ComfyUI/models -P
