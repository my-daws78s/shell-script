#!/bin/bash

set -e

SCRIPTNAME=$(echo $0 | cut -d "." -f1)
TIMESTAMP=$(date +%F-%H-%M-%S)
LOGFILE=/tmp/$SCRIPTNAME-$TIMESTAMP.log

USERID=$(id -u)
if [ $USERID -ne 0 ]
then
    echo "Pls login as root."
    exit 1
else
    echo "I am a root user."
fi

dnf install mysql-server -y &>>$LOGFILE
dnf install git &>>$LOGFILE

#using set -e will just throw error and stop the script whereever the error occurs..