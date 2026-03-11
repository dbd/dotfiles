#!/usr/bin/env bash
# Weather for Traverse City, MI via Open-Meteo (no API key required)

RESPONSE=$(curl --silent --max-time 5 \
    "https://api.open-meteo.com/v1/forecast?latitude=44.76&longitude=-85.62&current_weather=true&temperature_unit=fahrenheit&wind_speed_unit=mph")

if [[ -z "$RESPONSE" ]]; then
    echo "N/A"
    exit 0
fi

TEMP=$(echo "$RESPONSE" | jq -r '.current_weather.temperature | round | tostring + "°F"')
WIND=$(echo "$RESPONSE" | jq -r '.current_weather.windspeed | round | tostring + "mph"')
CODE=$(echo "$RESPONSE" | jq -r '.current_weather.weathercode')

case $CODE in
    0)            ICON="☀" ;;
    1)            ICON="🌤" ;;
    2)            ICON="⛅" ;;
    3)            ICON="☁" ;;
    45|48)        ICON="🌫" ;;
    51|53|55)     ICON="🌦" ;;
    61|63|65)     ICON="🌧" ;;
    71|73|75|77)  ICON="🌨" ;;
    80|81|82)     ICON="🌧" ;;
    85|86)        ICON="🌨" ;;
    95|96|99)     ICON="⛈" ;;
    *)            ICON="?" ;;
esac

printf '%s %s  Wind: %s\n' "$ICON" "$TEMP" "$WIND"
