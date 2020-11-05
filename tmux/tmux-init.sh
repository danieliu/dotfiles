#!/bin/zsh
session="main"

tmux start-server
tmux new-session -d -s $session -n seed

tmux new-window -t $session:1 -n insta
tmux new-window -t $session:2 -n notes
tmux new-window -t $session:3 -n dl
tmux new-window -t $session:4 -n code

tmux send-keys -t $session:1 "cdinsta" C-m
tmux send-keys -t $session:2 "cdnotes" C-m
tmux send-keys -t $session:3 "cdmov" C-m
tmux send-keys -t $session:4 "cdc" C-m

tmux select-window -t $session:0

tmux attach-session -t $session
