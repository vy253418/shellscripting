
#!/bin/bash
R="\e[31m"
G="\e[32m"
Y="\e[33m"
LOGS_FOLDER="/var/log/shellscript-logs"
LOG_File=$(echo $0 |cut -d "." -f1)
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)
LOG_FILE_NAME="$LOGS_FOLDER/$LOG_File-$TIMESTAMP.log"

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

dnf list installed mysql &>>$LOG_FILE_NAME

if [ $? -ne 0 ]   
then
  dnf install mysql  -y &>>$LOG_FILE_NAME
VALIDATE $? "Installing MYSQL"
  else
  echo -e $Y " MYSQL is alreday  INSTALLED"
fi

dnf list installed git 

if [ $? -ne 0 ]   
then
  dnf install git  -y &>>$LOG_FILE_NAME
VALIDATE $? "INSTALLING GIT"
  else
  echo -e  $Y " GIT is alreday INSTALLED"
fi