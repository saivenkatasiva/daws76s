#!/bin/bash
ID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
timestamp=$(date +%F-%H-%M-%S)
logfile="tmp/$0-$timestamp-log"

validate(){
if [ $1 -ne 0 ]
then
echo -e  "$R error : $2 installation failed $N"
else
echo -e "$R $2 installation Success$N"
fi
}

if [ $ID -ne 0 ]
then
echo -e "$R your not root user, please access with root user $N"
exit 1
else
echo -e "$G your root user $N"
fi

for package in $@
do
yum list installed $package
if [ $? ne 0 ]
then
yum install $package -y 
validate $? "MYSQL"
fi
done