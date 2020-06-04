#!/bin/bash
# changeVolume

# Arbitrary but unique message id
msgId="991049"

# Query amixer for the current volume and whether or not the speaker is muted
volume="$(amixer -D pulse sget Master | grep 'Left:' | awk -F'[][]' '{ print $2 }')"
mute="$(amixer -D pulse -c 0 get Master | tail -1 | awk '{print $6}' | sed 's/[^a-z]*//g')"
echo $volume
echo $mute


if [ "$mute" = "off" ]; then
    # Show the sound muted notification
    dunstify -a "changeVolume" -u low -i audio-volume-muted -r "$msgId" "Volume muted" 
else
    # Show the volume notification
    dunstify -a "changeVolume" -u low -i audio-volume-high -r "$msgId" \
    "Volume: ${volume}" 
fi
