#!/bin/bash
timestamp=$(date +"%Y-%m-%d_%H-%M-%S")
report_file="logs/report_$timestamp.txt"


echo "=========================" >> "$report_file"
echo " SERVER HEALTH REPORT " >> "$report_file"
echo "=========================" >> "$report_file"

echo "Hostname: $(hostname)" >> "$report_file"
echo "Date: $(date)" >> "$report_file"
echo "Uptime: $(uptime -p)" >> "$report_file"

echo "" >> "$report_file"
echo "Disk Usage" >> "$report_file"
df -h / >> "$report_file"

echo "" >> "$report_file"
echo "Memory Usage" >> "$report_file"
free -h >> "$report_file"

echo "" >> "$report_file"
echo "Current User: $(whoami)" >> "$report_file"

echo "" >> "$report_file"
echo "CPU Usage:" >> "$report_file"
top -bn1 | grep "Cpu(s)" >> "$report_file"

echo "" >> "$report_file"
echo "Top Processes:" >> "$report_file"
ps -eo pid,comm,%cpu --sort=-%cpu | head -6 >> "$report_file"

echo "" >> "$report_file"
echo "SSH Service Status:" >> "$report_file"
systemctl is-active ssh >> "$report_file"

echo "" >> "$report_file"
echo "CRON Service Status:" >> "$report_file"
systemctl is-active cron >> "$report_file"

echo "" >> "$report_file"
echo "Open Ports:" >> "$report_file"
ss -tuln >> "$report_file"

echo ""
echo "Report saved successfully:"
echo "$report_file"

./cleanup.sh

echo ""
echo "Running alert checks..."

./alerts.sh
