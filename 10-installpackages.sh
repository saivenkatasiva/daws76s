#!/bin/bash
ID=$(id -u)
R=\e[31m
G=\e[32m
Y=\e[33m
N=\e[0m
timestamp=$(date +%F-%H-%M-%S)
logfile="tmp/$0-$timestamp-log"

validate(){
if [ $1 -ne 0 ]
then
echo "error : $2 installation failed"
else
echo "error : $2 installation Success"
fi
}

if [ $ID -ne 0 ]
then
echo -e "$R your not root user, please access with root user $N"
exit 1
else
echo -e "$G your root user $N"
fi

yum install mysql -y &>> $logfile
validate $? "MYSQL"

yum install git -y &>> $logfile
validate $? "git"

for package in $@
do
yum list installed $package
if [ $? ne 0 ]
then
yum install $package -y 
validate $? "MYSQL"
fi
done