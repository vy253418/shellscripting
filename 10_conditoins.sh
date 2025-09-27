#!/bin/bash
USERID=$(id -u)

if [ $USERID -ne 0 ]
then 
   echo "ERROR::you have must sudo access to execute this script"
   exit 1
fi

dnf list installed mysql 

if [ $? -ne 0 ]
then 
 dnf install mysql -y
if [ $? -ne 0 ]
 then 
 echo " ERROR: mysql is installing facing error"
 else
  echo "mysql is installed successfull"
  fi
 else
  echo " mysql is already installed "
  fi 
 
#  echo "mysql package is not installed yet"
#  else
#  echo " mysql package is already installed"
#  fi

# dnf install mysql -y 

# if [ $? -ne 0 ]
# then
#   echo "ERROR: the mysql instllation is Failuer"
#   exit 1
# else  
#   echo "the previous command is success"
# fi  

# # dnf install git -y

# if [ $? -ne 0 ]
# then  
#    echo "ERROR the previous command is Failuer"
# else 
#    echo "The git instllation  is Success"
# fi   

#if dnf install git -y
#then
#echo "The previous command is Success"
#else
#echo "ERROR the previous command is Failure"
#fi




