#!/bin/bash

DISK_USAGE=$(df -hT | grep xfs)
THRESHOLD=5
MESSAGE=""
echo $DISK_USAGE

while IFS= read -r line
do
    USAGE=$(echo $line | awk -F " " '{print $6F}' | cut -d "%" -f1)
    DIRECTORY=$(echo $line | awk -F " " '{print $NF}')
    if [ $USAGE -ge $THRESHOLD ]
    then
        #echo "$FOLDER is more than $THRESHOLD, Current usage: $USAGE \n"
        MESSAGE+="Usage of $DIRECTORY is: $USAGE, it has crossed the threshold limit: $THRESHOLD."
    fi
done <<< $DISK_USAGE

echo -e "Message: $MESSAGE"

echo "$MESSAGE" | mail -s "Disk Usage Alert" vujjimuralikrishna@gmail.com
# echo "body" | mail -s "subject" to-address