# Rubya Akter Badhon

# wallpaper
nitrogen --restore &

# statusbar
~/.local/bin/statusbar.sh &

# XDG portals
export XDG_CURRENT_DESKTOP=dwm
/usr/lib/xdg-desktop-portal-gtk &
/usr/lib/xdg-desktop-portal &

# bluetooth
blueman-applet &

# bluelight filter
# redshift &

# lockscreen
xss-lock -- betterlockscreen -l &

# desktop notification 
dunst &

# screenshot
export XDG_SESSION_TYPE=x11 

# execute wm
exec dwm
