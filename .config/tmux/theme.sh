#!/usr/bin/env bash

grey="#414868"
blue="#3d59a1"
foreground="#d8dee9"
background="#24283b"
yellow="#e0af68"
green="#9ece6a",

# Borders
tmux set-option -g pane-border-style "fg=${grey}"
tmux set-option -g pane-active-border-style "fg=${blue}"

# Status Bar
tmux set-option -g status-interval 1
tmux set-option -g status-style "bg=${background},fg=${foreground}"
tmux set-option -g status-left "#[bg=${green},fg=${background}]#{?client_prefix,#[bg=${yellow}],} #S "
tmux set-option -g  status-right ""

# Epoch
tmux set-option -ga status-right "#[fg=${background},bg=${green}] %s "

# Clock
tmux set-option -g clock-mode-style 24
tmux set-option -ga status-right "#[fg=${foreground},bg=${blue}] %FT%T %Z "

# Windows
tmux set-window-option -g window-status-current-format "#[fg=${foreground},bg=${blue}] #I #W "
tmux set-window-option -g window-status-format "#[fg=${foreground}]#[bg=${background}] #I #W "
tmux set-option -g message-style "bg=${yellow},fg=${background}"
