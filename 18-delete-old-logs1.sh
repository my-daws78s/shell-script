#!/bin/bash

SOURCE_DIR=$1
echo "Enter the Source Directory you want to find and remove file: $SOURCE_DIR"

if [ -d $SOURCE_DIR ]
then
    echo "The Source Directory exists"
else
    echo "The Source Directory is missing."
    exit 1
fi

FILES=$(find $SOURCE_DIR -name "*.log" -mtime -5)
echo "Files to delete are listed here: $FILES"

# Below while loop perfectly working:
# while IFS= read -r line
# do
#     echo "Deleting File: $line"
#     #rm -fr $line
# done <<< $FILES

#tested the below code and it works as well, I was trying with {$FILES} and that was causing 
#issue in deleting files:
for i in $FILES
do
    echo "Deleting File using for loop: $i" 
    rm -fr $i
done

# Tested via crontab as well:
# */2 * * * * sh /home/centos/shell-script/18-delete-old-logs1.sh /tmp/app-logs/
# tail -f /var/log/cron