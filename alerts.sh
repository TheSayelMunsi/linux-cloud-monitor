#!/bin/bash
source config.env


DISK_USAGE=$(df / | awk 'NR==2 {print $5}' | tr -d '%')
echo "Current Disk Usage: $DISK_USAGE%"

if [ "$DISK_USAGE" -gt "$DISK_LIMIT" ]
then 
   echo "ALERT: Disk usage exceeded limit!"
else
   echo "Disk usage normal"
fi



RAM_USAGE=$(free | awk '/Mem:/ {printf("%.0f"), $3/$2 *100}')

echo "RAM Usage: $RAM_USAGE%"


if [ "$RAM_USAGE" -gt "$RAM_LIMIT" ]
then 
   echo "ALERT: High RAM usage"
else
   echo "RAM normal"
fi

CPU_IDLE=$(top -bn1 | grep "Cpu(s)" | awk -F'id,' '{ split($1, arr, ","); print arr[4] }' |tr -d ' ')

CPU_USAGE=$(echo "100 - $CPU_IDLE" | bc)
CPU_INT=$(printf "%.0f" "$CPU_USAGE")

echo "CPU Usage: $CPU_INT%"

if [ "$CPU_USAGE" -gt "$CPU_LIMIT" ]
then
   echo "ALERT: CPU overloaded!"
else
   echo "CPU normal"
fi


if [ ! -f config.env ]
then
echo "ERROR: config.env not found"
exit
fi


