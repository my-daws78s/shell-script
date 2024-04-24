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

while IFS = read -r line
do
    find $SOURCE_DIR -name "*.log"
done <<< $SOURCE_DIR