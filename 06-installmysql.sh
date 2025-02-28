#!/bin/bash
 ID=$(id -u)
 if ( ID -ne 0)
 then
 echo "your not root user"
 else
 echo "your root user"
 fi