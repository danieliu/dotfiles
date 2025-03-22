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

# work
workb="fractional-b"
workf="fractional-f"
workm="fractional-m"

# backend
tmux new-session -d -s $workb -n "gql"
tmux new-window -t $workb:1 -n server
tmux new-window -t $workb:2 -n worker
tmux new-window -t $workb:3 -n code
tmux new-window -t $workb:4 -n code2
tmux new-window -t $workb:5 -n code3
tmux new-window -t $workb:6 -n notes
tmux new-window -t $workb:7 -n db

tmux send-keys -t $workb:0 "source ~/.zshrc.work" C-m
tmux send-keys -t $workb:1 "source ~/.zshrc.work" C-m
tmux send-keys -t $workb:2 "source ~/.zshrc.work" C-m
tmux send-keys -t $workb:3 "source ~/.zshrc.work" C-m
tmux send-keys -t $workb:4 "source ~/.zshrc.work" C-m
tmux send-keys -t $workb:5 "source ~/.zshrc.work" C-m
tmux send-keys -t $workb:6 "source ~/.zshrc.work" C-m
tmux send-keys -t $workb:7 "source ~/.zshrc.work" C-m

tmux send-keys -t $workb:0 "cdfb" C-m
tmux send-keys -t $workb:1 "cdfbs" C-m
tmux send-keys -t $workb:2 "cdfbs" C-m
tmux send-keys -t $workb:3 "cdfbs" C-m
tmux send-keys -t $workb:4 "cdfbs" C-m
tmux send-keys -t $workb:5 "cdfbs" C-m
tmux send-keys -t $workb:6 "cdfnotes" C-m
tmux send-keys -t $workb:7 "cdfb" C-m

# frontend
tmux new-session -d -s $workf -n serve
tmux new-window -t $workf:1 -n code
tmux new-window -t $workf:2 -n code2
tmux new-window -t $workf:3 -n code3

tmux send-keys -t $workf:0 "source ~/.zshrc.work" C-m
tmux send-keys -t $workf:1 "source ~/.zshrc.work" C-m
tmux send-keys -t $workf:2 "source ~/.zshrc.work" C-m
tmux send-keys -t $workf:3 "source ~/.zshrc.work" C-m

tmux send-keys -t $workf:0 "cdfff" C-m
tmux send-keys -t $workf:1 "cdfff" C-m
tmux send-keys -t $workf:2 "cdfff" C-m
tmux send-keys -t $workf:3 "cdfff" C-m

# mobile
# tmux new-session -d -s $workm -n mobile
# tmux new-window -t $workm:1 -n code

# tmux send-keys -t $workm:0 "source ~/.zshrc.work" C-m
# tmux send-keys -t $workm:1 "source ~/.zshrc.work" C-m

# tmux send-keys -t $workm:0 "cdfm" C-m
# tmux send-keys -t $workm:1 "cdfm" C-m

tmux select-window -t $session:0

tmux attach-session -t $session
