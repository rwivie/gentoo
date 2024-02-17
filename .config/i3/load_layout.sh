#!/bin/sh

# First we append the saved layout of workspace N to workspace M
#i3-msg "workspace --no-auto-back-and-forth M; append_layout ~/.config/i3/workspace_N.json"
#i3-msg "workspace --no-auto-back-and-forth 1; append_layout /home/ron/.config/i3/workspace_1.json"
i3-msg "workspace "1: "; append_layout /home/ron/.config/i3/workspace_1.json"

# And finally we fill the containers with the programs they had
#(kitty htop &)
#(kitty grc journalctl -f &)
#(kitty grc tail -f ~/.xsession-errors | ts &)
(alacritty --title htop -e htop &)
(alacritty --title follow -e grc journalctl -f &)
(alacritty --title xtail -e grc tail -f ~/.xsession-errors | ts &)
