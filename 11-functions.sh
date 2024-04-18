#!bin/bash
check=$(id -u)

if [ $check -ne 0 ]
then
    echo "its a failure and hence exiting here.."
    exit 68
else
    echo "I am a root user.."
fi

    dnf install git -y
    
    if [ $? -ne 0 ]
    then
        echo "Failed to install git.."
        exit 10
    else
        echo "git installation went successful..."
    fi
