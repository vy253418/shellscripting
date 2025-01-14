
#!/bin/bash
R=\e[31m
G=\e[32m
Y=\e[33m

USERID=$(id -u)
VALIDATE() {
if [$1 -ne 0 ] 
then 
  echo -e "$2 $R....FAILURE"
  exit 1
  else 
   echo -e "$2 $G...SUCCESS"
fi  

}

if [ $USERID -ne 0 ]
 then
  echo "ERROR:: You must have sudo access exeute this script"
  exit 1 
fi 

dnf list installed mysql 

if [ $? -ne 0 ]   
then
  dnf install mysql  -y
VALIDATE $? "Installing MYSQL"
  else
  echo -e $Y" MYSQL is alreday INSTALLED"
fi

dnf list installed git 

if [ $? -ne 0 ]   
then
  dnf install git  -y
VALIDATE $? "INSTALLING GIT"
  else
  echo -e $Y " GIT is alreday INSTALLED"
fi