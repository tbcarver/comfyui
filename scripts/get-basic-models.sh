#!/bin/bash

source ./get-helper.sh

# vae approx
$taesd_test_file_path = "/workspace/ComfyUI/models/vae_approx/taesd_decoder.pth"
if [ ! -d "$taesd_test_file_path" ]; then
  TEMP_DIR=$(mktemp -d)
  git clone --depth 1 https://github.com/madebyollin/taesd.git "$TEMP_DIR"
  find "$TEMP_DIR" -name "*.pth" -exec cp {} /workspace/ComfyUI/models/vae_approx \;
  rm -rf "$TEMP_DIR"
fi
