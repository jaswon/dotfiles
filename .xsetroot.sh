INTERFACE="wlp1s0"
SSID=$(iw dev "$INTERFACE" link | grep SSID | sed 's/.*: //')
TIME=$(date +"(%a) %b %e, %Y %I:%M %p")
BATT_PERC=$(acpi | sed 's/.*, \([0-9]\+\)%.*/\1/')
BATT_STATE=$(acpi | sed 's/.*: \([a-zA-Z]\+\).*/\1/')
WIFI=$(awk '/'$INTERFACE'/ {printf("%2.0f", $3 / 70 * 100);}' /proc/net/wireless)
VOLUME=$(amixer sget Master | grep % | sed 's/%.*//;s/.*\[//')

if [ $WIFI -gt 66 ]; then
  WIFI_SYM=$'\U00e21a'
elif [ $WIFI -gt 33 ]; then
  WIFI_SYM=$'\U00e219'
else
  WIFI_SYM=$'\U00e218'
fi

if [ $BATT_STATE == 'Full' ]; then
  BATT_SYM=$'\U00e200'
elif [ $BATT_STATE == 'Discharging' ]; then
  BATT_SYM=$'\U00e1ff'
elif [ $BATT_STATE == 'Charging' ]; then
  BATT_SYM=$'\U00e201'
else
  BATT_SYM=$'\U00e211'
fi

VOL_SYM=$'\U00e152'

# echo $SSID $TIME $BATT_SYM $BATT_PERC $WIFI_SYM $WIFI $VOLUME

xsetroot -name " [ $WIFI_SYM$SSID ] [ $VOL_SYM$VOLUME ] [ $BATT_SYM$BATT_PERC ] [ $TIME ]"
