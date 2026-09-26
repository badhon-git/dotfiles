# Rubya Akter Badhon

#!/bin/sh

dir=~/Pictures/Screenshots
mkdir -p "$dir"
marker=$(mktemp)

mode=$(printf "Crop\nFull" | dmenu -p "Screenshot:")

case "$mode" in
    Crop)
        flameshot gui -p "$dir"
        ;;
    Full)
        flameshot full -p "$dir"
        ;;
    *)
        notify-send "Screenshot cancelled" "No mode selected"
        exit 0
        ;;
esac

newfile=$(find "$dir" -newer "$marker" -name "*.png" | head -1)
rm -f "$marker"

if [ -n "$newfile" ]; then
    xclip -selection clipboard -t image/png -i "$newfile" 2>/dev/null
    notify-send -i "$newfile" "Screenshot saved" "$(basename "$newfile")"
else
    notify-send "Screenshot cancelled" "No file was saved"
fi
