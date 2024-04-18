check=$(id -u)

if [ $check -ne 0 ]
then
    echo "its a failure and hence exiting here.."
    exit 68
else
    echo "its a success message"
fi

    dnf install mysqll -y
    
    if [ $? -ne 0 ]
    then
        echo "Failed to install mysql.."
        exit 10
    else
        echo "mysql installation went successful..."
    fi
