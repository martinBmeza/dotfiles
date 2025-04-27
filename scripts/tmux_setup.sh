#!/bin/bash

############################################################################# 
# Tmux session setup for working in prosody project.                        #
# Session gets the name of the host, 7 windows are created as follows:      #
# 1 - main                                                                  #
# 2 - src                                                                   #
# 3 - cfgs                                                                  #
# 4 - aux                                                                   #
# 5 - servers                                                               #
# 6 - status                                                                #
# 7 - data/notes                                                            #
############################################################################# 
tboard_launch_command="tensorboard --samples_per_plugin images=100 --logdir=results"
jupyter_launch_command="jupyter notebook --no-browser"
SESSION=$(hostname)

tmux new-session -d -s $SESSION -n main

# 1 - main
tmux send-keys -t $SESSION:main "clear && conda activate prosody" C-m
tmux send-keys -t $SESSION:main "cd prosody" C-m

# 2 - src
tmux new-window -t $SESSION -n src
tmux send-keys -t $SESSION:src "cd prosody/src" C-m

# 3 - cfg
tmux new-window -t $SESSION -n cfgs
tmux send-keys -t $SESSION:cfgs "cd prosody/configs" C-m

# 4 - aux
tmux new-window -t $SESSION -n aux
tmux send-keys -t $SESSION:aux "conda activate prosody" C-m
tmux send-keys -t $SESSION:aux "cd prosody" C-m

# 5 - servers
tmux new-window -t $SESSION -n servers
tmux send-keys -t $SESSION:servers "conda activate prosody && $jupyter_launch_command" C-m
tmux split-window -v -t $SESSION:servers
tmux send-keys -t $SESSION:servers "conda activate prosody && $tboard_launch_command" C-m

# 6 - status
tmux new-window -t $SESSION -n stats
tmux send-keys -t $SESSION:stats "nvtop" C-m
tmux split-window -v -t $SESSION:stats
tmux send-keys -t $SESSION:stats "htop" C-m

# 7 - data/notes
tmux new-window -t $SESSION -n notes
tmux send-keys -t $SESSION:notes "clear" C-m

# Adjuntar a la sesión
tmux select-window -t $SESSION:main
tmux attach-session -t $SESSION

