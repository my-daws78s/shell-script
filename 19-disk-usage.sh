#!/bin/bash

DISK_USAGE=$(df -hT | grep "ntfs")
THRESHOLD=75

while IFS= read -r line
do
    USAGE=$(df -hT | grep "ntfs" | awk -F " " '{print $7F}' | cut -d "%" -f1)"
    DIRECTORY=$(df -hT | grep "ntfs" | awk -F " " '{print $NF}')
    if [ $USAGE -ge $THRESHOLD ]
    then
        echo "Usage of $DIRECTORY is: $USAGE, it has crossed the threshold limit: $THRESHOLD."
    fi
done

