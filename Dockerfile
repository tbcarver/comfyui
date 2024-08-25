FROM pytorch/pytorch:2.4.0-cuda12.4-cudnn9-runtime

WORKDIR /workspace

RUN apt-get update && apt-get install -y git && rm -rf /var/lib/apt/lists/*

RUN git clone --depth 1 https://github.com/comfyanonymous/ComfyUI.git /workspace/ComfyUI

WORKDIR /workspace/ComfyUI

RUN pip install --no-cache-dir -r requirements.txt

ENTRYPOINT ["python", "main.py", "--output-directory", "/workspace/ComfyUI/output", "--listen", "0.0.0.0"]
