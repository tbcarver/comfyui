#!/bin/bash

tmux new -d -s rclone_models './rclone-import-models.sh'
tmux new -s get_models './get-models.sh; bash'
