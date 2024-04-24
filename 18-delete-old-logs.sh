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

FILES=$(find $SOURCE_DIR -name "*.log")
#FILES=$(find $SOURCE_DIR -name "*.log" -mtime +5) #deletes files older than 5days
#FILES=$(find $SOURCE_DIR -name "*.log" -mtime -5) #deletes files last 5days
echo "Files to delete are listed here: $FILES"

#Prerquisite:
#create /tmp/app-logs directory and few old files using command: touch -d yyyymmdd filename.log

# Output:

# [ ec2-user@ip-172-31-86-68 ~/shell-script ]$ sh 18-delete-old-logs.sh /tmp/app-logs
# Enter the Source Directory you want to find and remove file: /tmp/app-logs
# The Source Directory exists
# Files to delete are listed here: /tmp/app-logs/file4.log
# /tmp/app-logs/file3.log
# /tmp/app-logs/file2.log
# /tmp/app-logs/file1.log
