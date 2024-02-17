#!/bin/sh

sleep 20 && dbus-update-activation-environment --systemd --all &

xrdb merge ~/.Xresources &
nitrogen --restore &
/usr/libexec/polkit-gnome-authentication-agent-1 &
(sleep 5; nm-applet) &
(sleep 5; blueman-applet) &
numlockx on &
mpdris2-rs &
dunst -conf ~/.config/dunst/dunstrc &
#picom --config ~/.config/picom/picom.conf --daemon &
compfy -b &
/home/ron/.local/share/flatpak/exports/bin/ca.andyholmes.Valent &
thunderbird &
(sleep 1; xautolock -time 10 -locker lock -corners '+-00' -cornerdelay 15 -notify 15 -notifier "notify-send 'Screen will lock in 15 s'") &
#(sleep 1; xautolock -detectsleep -time 10 -locker 'lock -n' -killtime 11 -killer 'systemctl suspend' -corners '+-00' -cornerdelay 15 -notify 15 -notifier "notify-send 'Screen will lock in 15 s'") &
sleep 10 && mpd &
#firewall-applet &
LD_PRELOAD="/home/ron/Build/manual/sdl_screensaver_fix/sdl_block_screensaver_inhibit.so" SDL_VIDEO_ALLOW_SCREENSAVER=1 steam -silent %U &
sleep 10 && st -f "JetBrainsMono Nerd Font:style:regular:pixelsize=16" -g 253x35 -n hidden -e htop &
sleep 10 && st -f "JetBrainsMono Nerd Font:style:regular:pixelsize=16" -g 253x35 -n hidden -e grc journalctl -f &
sleep 10 && st -f "JetBrainsMono Nerd Font:style:regular:pixelsize=16" -g 253x35 -n hidden -e grc tail -f ~/.dwm.log &

sleep 15 && $HOME/.config/dwmblocks-async/build/dwmblocks &

#==== for mpDris2
# Define the name of the program you want to check and restart
#program_name="mpDris2"

# Check if the program is running
#if pgrep -x "$program_name" > /dev/null; then
#    echo "Stopping $program_name..."
#    pkill -x "$program_name"
#    sleep 1 # Give the program some time to terminate gracefully
#fi

# Start the program
#echo "Starting $program_name..."
#mpDris2 &
