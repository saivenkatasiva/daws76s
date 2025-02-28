#!/bin/bash
ID=$(id -u)
timestamp=$(date +%F-%H-%M-%S)
logfile="/tmp/$0-$timestamp-log"

validate(){
if [ $1 -ne 0 ]
then
echo "$2 installtion----failed"
exit 1
echo "SQL installtion----passed"
fi
}


if [ id -ne 0 ]
then
echo "your not root user, please access with root user "
exit 1
else
echo "yoiur root user"
fi

git install mysql -y $>> $logfile
validate $? "SQL" 

