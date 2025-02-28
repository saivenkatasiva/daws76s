#!/bin/bash
 ID=$(id -u)
 if [ $ID -ne 0 ]
 then
 echo "your not root user, Please run with root user access"
 exit 127
 else
 echo "your root user"
 fi

yum install mysql -y
if [ $? -ne 0 ]
then
echo "ERROR : sql installation failed "
exit 127
else
echo "sql installation success"
fi