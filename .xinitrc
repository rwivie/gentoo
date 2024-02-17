#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/Xresources
sysmodmap=/etc/X11/xinit/Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# user init scripts and settings
#[ -r ~/.Xmodmap ] && xmodmap ~/.Xmodmap
[ -r ~/.Xresources ] && xrdb -merge ~/.Xresources
[ -r ~/.xprofile ] && . ~/.xprofile

# start some nice programs

if [ -n "`/etc/X11/chooser.sh`" ]; then
 command="`/etc/X11/chooser.sh`"
else
 failsafe="yes"
fi

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?* ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi


#==== for dwm
export XDG_SESSION_DESKTOP="dwm"
export XDG_CURRENT_DESKTOP="dwm"
export XDG_SESSION_TYPE="x11"
#exec dbus-launch --sh-syntax --exit-with-session $HOME/.config/dwm-6.4/dwm 2>&1 | tee ~/.dwm.log
exec $HOME/.config/dwm-6.4/dwm 2>&1 | tee ~/.dwm.log

#==== for i3 
#export XDG_SESSION_TYPE="x11"
#export XDG_CURRENT_DESKTOP="i3"
#export XDG_SESSION_DESKTOP="i3"
#exec i3 2>&1 | tee ~/.i3.log

