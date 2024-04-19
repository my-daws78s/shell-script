#!/bin/bash

USERID $(id -u)

if [ $USERID -ne 0 ]
then
    echo "Pls perform as a root user."
    exit 1
else 
    echo "You are a root user."
fi

TIMESTAMP="date +%F-%H-%M-%S"
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
LOGFILE=/tmp/$SCRIPTNAME-$TIMESTAMP.log

for i in $@
do
    echo "Package to install: $i"
    dnf installed mysql $>>$LOGFILE
    if [ $? -eq 0 ]
    then
        echo "Package $i is already installed.... SKIPPING"
    else
        echo "Package $i is to be installed."
done