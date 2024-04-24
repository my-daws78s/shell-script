#!/bin/bash

set -e

#trap 'failure ${LINENO} "$BASH_COMMAND"' ERR
trap 'failure ${LINENO} "$BASH_COMMAND"' ERR

failure(){
    echo -e "Failed at Line: $1 and\ncommand is: $2"
}

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

dnf install mysql-serversss -y &>>$LOGFILE
dnf install gitsss &>>$LOGFILE


#using set -e will just throw error and stop the script whereever the error occurs..but does not show line number