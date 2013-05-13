#!/bin/bash
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

xrdb -merge ~/.Xresources

############################################################
                   ###  Start stuff  ###                    
############################################################
# run browser if passed browser argument from Login Manager
( test -z $1 || test $1 == 'browser' ) && browser &> ~/.log/browser.log &
# run dwmstatus
dwmstatus -l &> ~/.log/dwmstatus.log &
## run devmon
#( sleep 10 ; devmon --mount-options "noexec,nosuid,nodev,noatime" --ignore-label "archlinux" &> ~/.devmonlog) &
## start the screensaver daemon
#xscreensaver -no-splash &
# Start urxvt daemon so urxvt loads faster/uses less memory
urxvtd -q -f -o
# Start redshift, adjusting the temperature of the screen at night
redshift -l 48.421431:-122.260092 &>~/.log/redshift.log &
# Start telescope, a window switcher
telescope &>/dev/null &
# Start easystroke, a gesture recognition program
easystroke hide &>/dev/null &

############################################################
                ###  Change X settings  ###                 
############################################################
# add a background
tardisbg
# Make applications think we're using LG3D as a WM
#wmname LG3D
# Map caps lock to esc and shift-capslock to actual capslock
xmodmap -e 'clear Lock' -e 'keycode 66 = Escape Caps_Lock'

############################################################
                      ###  Run WM  ###                      
############################################################

#exec start_fusion

# Run dwm, restarting it when it dies, until
# a file named killx is in the home directory
# Then, exit and remove the file
while true; do
    while test ! -f ~/stopdwm; do
        # Run dwm and Log stderr to a file
        dwm &> ~/.log/dwm.log
    done
    rm ~/stopdwm
    if test -f ~/startopenbox; then
        rm ~/startopenbox
        openbox 2> /dev/null
    else
        break
    fi
done
