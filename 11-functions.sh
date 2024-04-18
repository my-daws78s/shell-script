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
    echo "exit status: $1"
    echo "git installation"
}

    dnf install git -y
    Validate $? "Installation of git"
    
