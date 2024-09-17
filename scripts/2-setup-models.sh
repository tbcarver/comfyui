#!/bin/bash

tmux new -d -s rclone-get-models './rclone-get-models.sh'
tmux new -s get-models './get-flux-models.sh; bash'
