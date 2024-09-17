#!/bin/bash

source ./get-helper.sh
source ./get-basic-models.sh

# clip
get_model "https://huggingface.co/comfyanonymous/flux_text_encoders/resolve/main/clip_l.safetensors?download=true" "/workspace/ComfyUI/models/clip/clip_l.safetensors"

# vae
get_model "https://huggingface.co/stabilityai/sd-vae-ft-mse-original/resolve/main/vae-ft-mse-840000-ema-pruned.safetensors?download=true" "/workspace/ComfyUI/models/vae/vae-ft-mse-840000-ema-pruned.safetensors"

# unet
get_zipped "https://civitai.com/api/download/models/782728" "/workspace/ComfyUI/models/unet/hyper-1.5-5q-k-m.zip" "/workspace/ComfyUI/models/unet/hyper-1.5-5q-k-m.gguf"
