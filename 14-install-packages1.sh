#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo "Pls perform as a root user."
    exit 1
else 
    echo "You are a root user."
fi

VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo -e "$2 .... $R Failure $N"
    else
        echo -e "$2 .... $G Success $N"
    fi
}

TIMESTAMP=$(date +%F-%H-%M-%S)
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
LOGFILE=/tmp/$SCRIPT_NAME-$TIMESTAMP.log
R="\e[31m"
G="\e[32m"
Y="\e[33m"
B="\e[34m"
N="\e[0m"

echo -e "$B Script Start time: $TIMESTAMP $N"

for i in $@
do
    echo "Package to install: $i"
    dnf list installed $i -y &>>$LOGFILE
    if [ $? -eq 0 ]
    then
        echo -e "Package $i is already installed.... $Y SKIPPING $N"
    else
        echo -e "$R Package $i is not installed yet.... $N"
        dnf install $i &>>$LOGFILE
        VALIDATE $? "Installation of $i"
    fi
done

echo -e "$B Script End time: $TIMESTAMP $N"