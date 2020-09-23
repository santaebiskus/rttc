#!/bin/bash
i=1
while true; do
ping -c1 8.8.8.8 > /dev/null
ping_r=$?
if [[ "$ping_r" -eq 0 && "$i" = "-1" || "$ping_r" -ne 0 && "$i" = "1" ]]
then
    if [ $ping_r -eq 0 ]
    then
	echo "$(date +%H:%M:%S-%d-%m-%y) интернет появился" >> journal.txt
    else
	echo "$(date +%H:%M:%S-%d-%m-%y) интернет пропал" >> journal.txt
    fi
    let "i *= -1"
fi
sleep 5
done