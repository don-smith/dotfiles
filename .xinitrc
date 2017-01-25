#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

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

# Initialise config files
if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

# Set a wallpaper
feh --bg-scale ~/images/wallpaper/arch-pattern.png
#feh --bg-scale ~/images/wallpaper/arch-wall.png
#feh --bg-scale ~/images/wallpaper/arch-blue.png
#feh --bg-scale ~/images/wallpaper/arch-teal.png
#feh --bg-scale ~/images/wallpaper/arch-grain.png

# Start i3
exec i3

# Start polkit authentication agent
exec /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1
