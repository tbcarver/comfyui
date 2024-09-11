#!/bin/bash

# clips
wget -O /workspace/ComfyUI/models/clip/clip_l.safetensors "https://huggingface.co/comfyanonymous/flux_text_encoders/resolve/main/clip_l.safetensors?download=true"
wget -O /workspace/ComfyUI/models/clip/t5xxl_fp16.safetensors "https://huggingface.co/comfyanonymous/flux_text_encoders/resolve/main/t5xxl_fp16.safetensors?download=true"
wget -O /workspace/ComfyUI/models/clip/t5xxl_fp8_e4m3fn.safetensors "https://huggingface.co/comfyanonymous/flux_text_encoders/resolve/main/t5xxl_fp8_e4m3fn.safetensors?download=true"

# vae
wget -O /workspace/ComfyUI/models/clip/vae-ft-mse-840000-ema-pruned.safetensors "https://huggingface.co/stabilityai/sd-vae-ft-mse-original/resolve/main/vae-ft-mse-840000-ema-pruned.safetensors?download=true"
wget -O /workspace/ComfyUI/models/clip/clip-vit-large-patch14-model.safetensors "https://huggingface.co/openai/clip-vit-large-patch14/resolve/main/model.safetensors?download=true"
wget -O /workspace/ComfyUI/models/clip/FLUX1-dev-diffusion_pytorch_model.safetensors  "https://huggingface.co/black-forest-labs/FLUX.1-dev/resolve/main/vae/diffusion_pytorch_model.safetensors?download=true"

# unet
#wget -O /workspace/ComfyUI/models/unet/flux_dev.safetensors "https://civitai-delivery-worker-prod.5ac0637cfd0766c97916cefa3764fbdf.r2.cloudflarestorage.com/model/3/flux1Dev.Y7Az.safetensors?X-Amz-Expires=86400&response-content-disposition=attachment%3B%20filename%3D%22flux_dev.safetensors%22&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=e01358d793ad6966166af8b3064953ad/20240827/us-east-1/s3/aws4_request&X-Amz-Date=20240827T134152Z&X-Amz-SignedHeaders=host&X-Amz-Signature=805ca68d4c898549d5dce77b7e6ffb83d4cc8104ca6f569f7ba7e219c2aad351"
echo "flux gguf https://huggingface.co/city96/FLUX.1-dev-gguf/tree/main"
