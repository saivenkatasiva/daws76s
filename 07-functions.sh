#!/bin/bash
ID=$(id -u)
validate(){
if [ $1 ne 0 ]
echo "$2 installation failed"
else
echo "$2 installation SUCCESS"
fi

}

if [ $ID -ne 0 ]
then
echo "your not root user, Please run with root user access"
else
echo "your root user"
fi

yum install mysql -y
validate $? "mysql"
yum install git -y
validate $? "git"
