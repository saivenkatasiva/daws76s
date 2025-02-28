#!/bin/bash
 ID=$(id -u)
 if [ $ID -ne 0 ]
 then
 echo "your not root user, Please run with root user access"
 else
 echo "your root user"
 fi