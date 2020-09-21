#!/bin/bash
i=1
while true; do
ping -c1 8.8.8.8
ping_r=$?
if [[ "$ping_r" -eq 0 && "$i" = "-1" || "$ping_r" -ne 0 && "$i" = "1" ]]
then
    echo "$(date +%H:%M:%S-%d-%m-%y)" `ping -c1 8.8.8.8` >> journal.txt
    let "i *= -1"
fi
sleep 5
done