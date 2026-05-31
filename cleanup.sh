#!/bin/bash
source config.env
DAYS=$LOG_RETENTION_DAYS
find logs/ -type f -mtime +$DAYS -delete
echo "Deleted logs older than $DAYS days"

TOTAL_LOGS=$(ls logs | wc -l)
echo "Remaining reports: $TOTAL_LOGS"
