#!/bin/bash

file1="/sys/class/hwmon/hwmon1/temp1_input"
file2="/sys/class/hwmon/hwmon2/temp1_input"

while true; do
	read -d $'\x04' temp1 < "$file1"
	read -d $'\x04' temp2 < "$file2"

	if [ $temp1 -gt 74000 ] || [ $temp2 -gt 74000 ]
	then
		fan_ctrl on
	elif [ $temp1 -lt 65000 ] && [ $temp2 -lt 65000 ]
	then
		fan_ctrl off
	fi
	sleep 5
done
