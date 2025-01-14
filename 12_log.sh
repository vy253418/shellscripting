
#!/bin/bash
R="\e[31m"
G="\e[32m"
Y="\e[33m"
LOGS_FOLDER="/var/log/shellscript-logs"
LOG_File=$(echo $0 |cut -d "." -f1)
TIMESTAMP=$(date +%Y-%m-%D-%T)
LOG_FOLDER-File="/$LOGS_FOLDER/$LOG_File-$TIMESTAMP.log"

USERID=$(id -u)
VALIDATE() {
if [$1 -ne 0 ] 
then 
  echo -e "$2 $R....FAILURE" &>>LOG_FOLDER-File
  exit 1
  else 
   echo -e "$2 $G...SUCCESS" &>>LOG_FOLDER-File
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
  dnf install mysql  -y &>>LOG_FOLDER-File
VALIDATE $? "Installing MYSQL"
  else
  echo -e $Y " MYSQL is alreday  INSTALLED"
fi

dnf list installed git 

if [ $? -ne 0 ]   
then
  dnf install git  -y &>>LOG_FOLDER-File
VALIDATE $? "INSTALLING GIT"
  else
  echo -e  $Y " GIT is alreday INSTALLED"
fi