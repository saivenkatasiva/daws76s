#!/bin/bash
ID=$(id -u)
timestamp=$(date +%F-%H-%M-%S)
logfile="/tmp/$0-$timestamp-log"

validate(){
if [ $1 -ne 0 ]
then
echo "$2 installtion----failed"
exit 1
echo "$2 installtion----passed"
fi
}


if [ $ID -ne 0 ]
then
echo "your not root user, please access with root user "
exit 1
else
echo "your root user"
fi

yum install mysql -y &>> $logfile
validate $? "SQL" 

