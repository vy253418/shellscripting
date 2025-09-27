#!/bin/bash
USERID=$(id -u)

if [ $USERID -ne 0 ]
then 
   echo "ERROR::you have must sudo access to execute this script"
   exit 1
fi

dnf install mysqll -y 

if [ $? -ne 0 ]
then
  echo "ERROR: the previous command is Failuer"
  exit 1

dnf install git -y





