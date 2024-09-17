FROM pytorch/pytorch:2.4.1-cuda12.1-cudnn9-runtime

WORKDIR /workspace
RUN apt-get update && apt-get install -y \
    curl \
    unzip \
    git \
    tmux \
    nano \
    rclone \
    inotify-tools \
    openssh-server && \
    rm -rf /var/lib/apt/lists/*

# ComfyUI
RUN git clone https://github.com/comfyanonymous/ComfyUI.git /workspace/ComfyUI
WORKDIR /workspace/ComfyUI
RUN pip install --no-cache-dir -r requirements.txt
EXPOSE 8188

# ComfyUI custom nodes
WORKDIR /workspace/ComfyUI/custom_nodes
RUN git clone https://github.com/ltdrdata/ComfyUI-Manager.git && \
    mkdir -p /usr/share/fonts/truetype && \
    git clone https://github.com/11cafe/comfyui-workspace-manager.git && \
    git clone https://github.com/crystian/ComfyUI-Crystools.git && \
    pip install -r ComfyUI-Crystools/requirements.txt && \
    git clone https://github.com/city96/ComfyUI-GGUF.git && \
    pip install -r ComfyUI-GGUF/requirements.txt && \
    git clone https://github.com/Suzie1/ComfyUI_Comfyroll_CustomNodes.git && \
    git clone https://github.com/tbcarver/image-gallery-comfyui.git

# ssh server
RUN mkdir /var/run/sshd && \
    mkdir -p /root/.ssh && \
    sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config && \
    sed -i 's/#PasswordAuthentication yes/PasswordAuthentication no/' /etc/ssh/sshd_config && \
    sed -i 's/#PubkeyAuthentication yes/PubkeyAuthentication yes/' /etc/ssh/sshd_config && \
    chmod 700 /root/.ssh
RUN touch /root/.ssh/authorized_keys && \
    chmod 600 /root/.ssh/authorized_keys && \
    chown root:root /root/.ssh/authorized_keys
EXPOSE 22

COPY workflows /workspace/ComfyUI/my_workflows
COPY scripts /root/scripts
RUN chmod -R +x /root/scripts

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

WORKDIR /workspace/ComfyUI
CMD ["sh", "-c", "python main.py --preview-method taesd --output-directory /workspace/ComfyUI/output --listen 0.0.0.0 $COMFYUI_ARGS"]
