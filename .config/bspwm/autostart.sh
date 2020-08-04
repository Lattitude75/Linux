#!/bin/bash

function run {
  if ! pgrep $1 ;
  then
    $@&
  fi
}



#Find out your monitor name with xrandr or arandr (save and you get this line)
#xrandr --output VGA-1 --primary --mode 1360x768 --pos 0x0 --rotate normal
#xrandr --output DP2 --primary --mode 1920x1080 --rate 60.00 --output LVDS1 --off &
#xrandr --output LVDS1 --mode 1366x768 --output DP3 --mode 1920x1080 --right-of LVDS1
#xrandr --output HDMI2 --mode 1920x1080 --pos 1920x0 --rotate normal --output HDMI1 --primary --mode 1920x1080 --pos 0x0 --rotate normal --output VIRTUAL1 --off


#change your keyboard if you need it
#setxkbmap -layout be

#Some ways to set your wallpaper besides variety or nitrogen

xsetroot -cursor_name left_ptr &
run sxhkd -c ~/.config/bspwm/sxhkd/sxhkdrc &

# setting the synaptic configuration
synclient TapButton1=1
synclient TapButton2=3
synclient VertScrollDelta=-111
synclient HorizScrollDelta=-111
synclient HorizTwoFingerScroll=1
synclient VertEdgeScroll=0


## System applets and applications
#conky -c $HOME/.config/bspwm/system-overview &
run nm-applet &
run xfce4-power-manager &
#run kdeconnect-indicator &
numlockx on &
blueman-applet &
picom --config $HOME/.config/bspwm/picom.conf &
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
/usr/lib/xfce4/notifyd/xfce4-notifyd &
run pa-applet &
run gnome-screensaver &
nitrogen --restore &
$HOME/.config/polybar/launch.sh &
run fusuma &
run pulseeffects --gapplication-service &
run syndaemon -i 0.5 -t -K -R & #To disable touchpad while typing
#run caffeine &
#run firefox &
#run thunar &
#run dropbox &
#run insync start &
#run discord &
#run spotify &
#run atom &

# All the autostart applications and setup

# setting ofono to enable HFP in bluetooth pulseaudio
~/.bin/ofono_script &

# applications
sleep 5 && dropbox start &
