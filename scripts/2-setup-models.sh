#!/bin/bash

tmux new -d -s get-rclone-models './get-rclone-models.sh'
tmux new -s get-models './get-flux-models.sh; bash'
