# Rubya Akter Badhon
#!/bin/sh

while true; do
    battery=$(acpi -b | grep -o '[0-9]*%' | head -1)
    date_str=$(date '+%a %d %b')
    time_str=$(date '+%H:%M')

    volume=$(pactl get-sink-volume @DEFAULT_SINK@ 2>/dev/null | grep -o '[0-9]*%' | head -1)
    muted=$(pactl get-sink-mute @DEFAULT_SINK@ 2>/dev/null | grep -o 'yes')

    if [ "$muted" = "yes" ]; then
        vol_icon=" MUTE"
    else
        vol_icon=" $volume"
    fi

    if bluetoothctl show | grep -q "Powered: yes"; then
        bt_status=" ON"
    else
        bt_status=" OFF"
    fi

    wifi_ssid=$(nmcli -t -f active,ssid dev wifi 2>/dev/null | grep '^yes' | cut -d: -f2)
    if [ -n "$wifi_ssid" ]; then
        wifi_status=" $wifi_ssid"
    else
        wifi_status=" Disconnected"
    fi

    xsetroot -name " $wifi_status | $vol_icon | $bt_status |  $battery |  $date_str |  $time_str "

    sleep 1
done
