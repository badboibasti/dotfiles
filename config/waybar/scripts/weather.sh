#!/bin/bash

API_KEY="14f5e85e15864d271b9d08739528b8e6" #OpenWeather API key
CITY_ID="2805753"

data=$(curl -sf "https://api.openweathermap.org/data/2.5/weather?id=$CITY_ID&appid=$API_KEY&units=metric")

if [ ! "$data" ]; then
    echo '{"text": " --°C", "tooltip": "Weather unavailable"}'
    exit
fi

temp=$(echo "$data" | jq '.main.temp' | xargs printf "%.0f")
desc=$(echo "$data" | jq -r '.weather[0].description')
icon="" # You can add logic for different icons based on weather code

echo "{\"text\": \"$icon ${temp}°C\", \"tooltip\": \"$desc\"}"
