Minimal install for ComfyUI

docker build -t tbcarver/comfyui:latest-cuda12.4 .
docker run -d --name comfy -p 8188:8188 -p 2222:22 -e COMFYUI_ARGS="--cpu" tbcarver/comfyui:latest-cuda12.4
docker exec -it comfy bash
