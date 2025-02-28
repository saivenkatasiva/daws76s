#!/bin/bash
ID=$(id -u)
timestamp=$(date +%F-%H-%M-%S)
logfile="/tmp/$0-$timestamp-log"
R="\e[31m"
G="\e[32m"
N="\e[0m"

validate(){
if [ $1 -ne 0 ]
then
echo -e "$2 installtion----$R failed"
exit 1
else
echo -e "$2 installtion----$G success"
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

