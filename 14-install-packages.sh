#!/bin/bash

checkid=$(id -u)
if [ $checkid -ne 0 ]
then
    echo "This is not a root user. Pls run as root."
    exit 1
else
    echo "I am a root user."
fi

echo "All Packages: $@"
