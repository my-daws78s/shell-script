#Adding colors to output messages:

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
LOGFILE=/tmp/$FILENAME-$DATE.log

R="\e[31m"
G="\e[32m"
N="\e[0m"

VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo -e "$2..... $R Failure! $N"
    else
        echo -e "$2..... $G Success! $N"
    fi
}

dnf install git -y &>> $LOGFILE
VALIDATE $? "Installation of GIT Is ::"

dnf install dockerrr -y &>> $LOGFILE
VALIDATE $? "Installation of Docker Is ::"
