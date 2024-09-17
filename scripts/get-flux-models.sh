#!/bin/bash

source ./get-helper.sh
source ./get-basic-models.sh

### basics ###

# clips
get_model "https://huggingface.co/comfyanonymous/flux_text_encoders/resolve/main/clip_l.safetensors?download=true" "/workspace/ComfyUI/models/clip/clip_l.safetensors"
get_model "https://huggingface.co/comfyanonymous/flux_text_encoders/resolve/main/t5xxl_fp16.safetensors?download=true" "/workspace/ComfyUI/models/clip/t5xxl_fp16.safetensors"


### GGUF ###
# clips
get_model "https://huggingface.co/city96/t5-v1_1-xxl-encoder-gguf/resolve/main/t5-v1_1-xxl-encoder-Q6_K.gguf?download=true" "/workspace/ComfyUI/models/clip/t5-v1_1-xxl-encoder-Q6_K.gguf"

# vae
get_model "https://huggingface.co/black-forest-labs/FLUX.1-dev/resolve/main/ae.safetensors?download=true" "/workspace/ComfyUI/models/vae/FLUX1-dev-ae.safetensors"

# unet
get_model "https://huggingface.co/city96/FLUX.1-dev-gguf/resolve/main/flux1-dev-Q6_K.gguf?download=true" "/workspace/ComfyUI/models/unet/flux1-dev-Q6_K.gguf"


### Flux Dev 1 ###
# vae
get_model "https://huggingface.co/black-forest-labs/FLUX.1-dev/resolve/main/ae.safetensors?download=true" "/workspace/ComfyUI/models/vae/FLUX1-dev-ae.safetensors"

# unet
get_model "https://huggingface.co/black-forest-labs/FLUX.1-dev/resolve/main/flux1-dev.safetensors?download=true" "/workspace/ComfyUI/models/unet/flux1-dev.safetensors"


### Extra models ###

# clips
get_model "https://huggingface.co/comfyanonymous/flux_text_encoders/resolve/main/t5xxl_fp8_e4m3fn.safetensors?download=true" "/workspace/ComfyUI/models/clip/t5xxl_fp8_e4m3fn.safetensors"
get_model "https://huggingface.co/openai/clip-vit-large-patch14/resolve/main/model.safetensors?download=true" "/workspace/ComfyUI/models/clip/clip-vit-large-patch14-model.safetensors"

# vae

# unet
