FROM pytorch/pytorch:2.4.0-cuda12.4-cudnn9-runtime

WORKDIR /workspace
RUN apt-get update && apt-get install -y \
    git \
    tmux \
    nano \
    rclone \
    openssh-server && \
    rm -rf /var/lib/apt/lists/*

# ComfyUI
RUN git clone --depth 1 https://github.com/comfyanonymous/ComfyUI.git /workspace/ComfyUI
WORKDIR /workspace/ComfyUI
RUN pip install --no-cache-dir -r requirements.txt
EXPOSE 8188

# ComfyUI custom nodes
WORKDIR /workspace/ComfyUI/custom_nodes
RUN git clone --depth 1 https://github.com/ltdrdata/ComfyUI-Manager.git

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

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

CMD ["sh", "-c", "python main.py --output-directory /workspace/ComfyUI/output --listen 0.0.0.0 $COMFYUI_ARGS"]
