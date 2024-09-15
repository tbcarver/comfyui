#!/bin/bash
service ssh start
tmux new-session -d -s rclone-sync '/root/scripts/rclone-sync.sh'
exec "$@"
