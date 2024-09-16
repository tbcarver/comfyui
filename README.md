# Minimal install for ComfyUI

Includes the following custom nodes:
* https://github.com/ltdrdata/ComfyUI-Manager
* https://github.com/11cafe/comfyui-workspace-manager
* https://github.com/crystian/ComfyUI-Crystools
* https://github.com/city96/ComfyUI-GGUF
* https://github.com/Suzie1/ComfyUI_Comfyroll_CustomNodes
* https://github.com/tbcarver/image-gallery-comfyui

Runs an rclone sync watching the /workspace/ComfyUI/output folder for changes and syncs to gdrive:/output or gdrive:$RCLONE_SYNC_DEST_DIR
Pass in $RCLONE_SYNC_DEST_DIR as docker run args ```-e RCLONE_SYNC_DEST_DIR=/output```

Script **/scripts/get-cpu-models.sh** for getting gguf models that will run a workflow using SD 1.5 on any CPU.
Script **/scripts/get-models.sh** for getting basic models for flux.

## Vast create arguments
-p 2222:22 -p 8188:8188 -e OPEN_BUTTON_PORT=8188 -e RCLONE_SYNC_DEST_DIR=/output
vastai create instance $instanceTypeId --image tbcarver/comfyui:latest-cuda12.4 --env '-p 2222:22 -p 8188:8188 -e OPEN_BUTTON_PORT=8188 -e RCLONE_SYNC_DEST_DIR=/output' --disk $diskSize  --args ''

### Build and run commands
docker build -t tbcarver/comfyui:latest-cuda12.4 .
docker push tbcarver/comfyui:latest-cuda12.4
docker run -d --name comfy -p 8188:8188 -p 2222:22 -e COMFYUI_ARGS="--cpu" -e RCLONE_SYNC_DEST_DIR="/output" tbcarver/comfyui:latest-cuda12.4
docker exec -it comfy bash

