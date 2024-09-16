#!/bin/bash

if [ -z "$HF_TOKEN" ]; then
    echo "HF_TOKEN is not set. Please enter your Hugging Face token:"
    read -r token
    export HF_TOKEN=$token
    echo "HF_TOKEN has been set."
else
    echo "HF_TOKEN is set."
fi

if [ -z "$CIVITAI_TOKEN" ]; then
    echo "Civitai API token is not set. Please enter your Civitai token:"
    read -r token
    export CIVITAI_TOKEN=$token
    echo "CIVITAI_TOKEN has been set."
else
    echo "CIVITAI_TOKEN is set."
fi

# clips
wget --header="Authorization: Bearer $HF_TOKEN" -O /workspace/ComfyUI/models/clip/clip-vit-large-patch14-model.safetensors "https://huggingface.co/openai/clip-vit-large-patch14/resolve/main/model.safetensors?download=true"

# vae
wget --header="Authorization: Bearer $HF_TOKEN" -O /workspace/ComfyUI/models/vae/vae-ft-mse-840000-ema-pruned.safetensors "https://huggingface.co/stabilityai/sd-vae-ft-mse-original/resolve/main/vae-ft-mse-840000-ema-pruned.safetensors?download=true"

# vae approx
TEMP_DIR=$(mktemp -d)
git clone --depth 1 https://github.com/madebyollin/taesd.git "$TEMP_DIR"
find "$TEMP_DIR" -name "*.pth" -exec cp {} /workspace/ComfyUI/models/vae_approx \;
rm -rf "$TEMP_DIR"

# unet
curl -L -H "Authorization: Bearer $CIVITAI_TOKEN" "https://civitai.com/api/download/models/782728" -o /workspace/ComfyUI/models/unet/hyper-1.5-5q-k-m.zip
unzip /workspace/ComfyUI/models/unet/hyper-1.5-5q-k-m.zip -d /workspace/ComfyUI/models/unet/hyper-1.5-5q-k-m.guff && rm /workspace/ComfyUI/models/unet/hyper-1.5-5q-k-m.zip
