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
echo "Files to delete are listed here: $FILES"

while IFS= read -r line
do
    echo "Deleting File: $line"
    #rm -fr $line
done <<< $FILES