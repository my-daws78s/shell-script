#!bin/bash

#Introducing Logs, Timestamp

CHECKUID=$(id -u)
if [ $CHECKUID -ne 0 ]
then
    echo "It is not a root user."
    exit 1
else
    echo "I am a root user."
fi

DATE=$(date +%F-%H-%M-%S)
FILENAME=$(echo $0 | cut -d "." -f1)
LOGFILE=/tmp/$FILENAME_$DATE.log

VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo "$2..... Failure!"
    else
        echo "$2..... Success!"
    fi
}

dnf install git -y &>> $LOGFILE
VALIDATE $? "Installtion of GIT IS ::"
