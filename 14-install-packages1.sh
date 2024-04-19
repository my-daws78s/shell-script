#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo "Pls perform as a root user."
    exit 1
else 
    echo "You are a root user."
fi

TIMESTAMP=$(date +%F-%H-%M-%S)
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
LOGFILE=/tmp/$SCRIPTNAME-$TIMESTAMP.log
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

for i in $@
do
    echo "Package to install: $i"
    dnf installed $i &>>$LOGFILE
    if [ $? -eq 0 ]
    then
        echo -e "Package $i is already installed.... $Y SKIPPING $N"
    else
        echo -e "$R Package $i is not installed yet.... $N"
    fi
done