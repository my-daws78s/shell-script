#!bin/bash

check=$(id -u)

if [ $check -ne 0 ]
then
    echo "its a failure and hence exiting here.."
    exit 68
else
    echo "I am a root user.."
fi

Validate(){
    if [ $? -ne 0 ]
    then
        echo "$2....Failure"
    else
        echo "$2....Success"
    fi
}
    dnf install git -y
    Validate $? "Installation of git"


    
