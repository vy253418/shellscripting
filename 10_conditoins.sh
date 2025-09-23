#!/bin/bash
USERID=$(id -u)

if [ $USERID -ne 0]
then 
   echo "ERROR::you have must sudo access to execute this script"
else

dnf install mysql -y

fi



