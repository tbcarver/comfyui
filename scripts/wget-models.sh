#!/bin/bash

if [ -z "$HF_TOKEN" ]; then
    echo "HF_TOKEN is not set. Please enter your Hugging Face token:"
    read -r token
    export HF_TOKEN=$token
    echo "HF_TOKEN has been set."
else
    echo "HF_TOKEN is set."
fi

# clips
wget --header="Authorization: Bearer $HF_TOKEN" -O /workspace/ComfyUI/models/clip/clip_l.safetensors "https://huggingface.co/comfyanonymous/flux_text_encoders/resolve/main/clip_l.safetensors?download=true"
wget --header="Authorization: Bearer $HF_TOKEN" -O /workspace/ComfyUI/models/clip/t5xxl_fp16.safetensors "https://huggingface.co/comfyanonymous/flux_text_encoders/resolve/main/t5xxl_fp16.safetensors?download=true"
wget --header="Authorization: Bearer $HF_TOKEN" -O /workspace/ComfyUI/models/clip/t5xxl_fp8_e4m3fn.safetensors "https://huggingface.co/comfyanonymous/flux_text_encoders/resolve/main/t5xxl_fp8_e4m3fn.safetensors?download=true"
wget --header="Authorization: Bearer $HF_TOKEN" -O /workspace/ComfyUI/models/clip/clip-vit-large-patch14-model.safetensors "https://huggingface.co/openai/clip-vit-large-patch14/resolve/main/model.safetensors?download=true"

# vae
wget --header="Authorization: Bearer $HF_TOKEN" -O /workspace/ComfyUI/models/vae/vae-ft-mse-840000-ema-pruned.safetensors "https://huggingface.co/stabilityai/sd-vae-ft-mse-original/resolve/main/vae-ft-mse-840000-ema-pruned.safetensors?download=true"
wget --header="Authorization: Bearer $HF_TOKEN" -O /workspace/ComfyUI/models/vae/FLUX1-dev-diffusion_pytorch_model.safetensors  "https://huggingface.co/black-forest-labs/FLUX.1-dev/resolve/main/vae/diffusion_pytorch_model.safetensors?download=true"

# unet
echo "flux gguf https://huggingface.co/city96/FLUX.1-dev-gguf/tree/main"
wget --header="Authorization: Bearer $HF_TOKEN" -O /workspace/ComfyUI/models/unet/flux1-dev-Q6_K.gguf "https://huggingface.co/city96/FLUX.1-dev-gguf/resolve/main/flux1-dev-Q6_K.gguf?download=true"
wget --header="Authorization: Bearer $HF_TOKEN" -O /workspace/ComfyUI/models/unet/flux1-dev.safetensors "https://huggingface.co/black-forest-labs/FLUX.1-dev/resolve/main/flux1-dev.safetensors?download=true"
