#!/bin/bash


USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
LOGS_FOLDER="/var/log/shell-script"
SCRIPT_NAME=$( echo $0 | cut -d "." -f1)
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME.log" #/var/logs/shell-script/16-logs.log

mkdir -p $LOGS_FOLDER
echo "script started executed at: $(date)" | tee -a $LOG_FILE

if [ $USERID -ne 0 ]; then
   echo -e "ERROR: Please run this script with root privilege"
   exit 1 # if we not use this then it will proceed with next lines
fi

VALIDATE(){
    if [ $1 -ne 0 ]; then
   echo  -e " ERROR: Installing $2  ... $R is fialure $N" | tee -a $LOG_FILE
   exit 1
else
    echo -e "$2 ... $R is installed $N" | tee -a $LOG_FILE
fi

}

dnf list installed mysql &>>$LOG_FILE
if [ $? -ne 0 ]; then 
    dnf install mysql -y &>>$LOG_FILE
    VALIDATE $? "MYSQL"
else 
    echo -e "MYSQL is already installed ..$Y SKIPPING $N" | tee -a $LOG_FILE
fi 

dnf list installed redis &>>$LOG_FILE
if [ $? -ne 0 ]; then 
   dnf install redis -y &>>$LOG_FILE
VALIDATE $? "REDIS"
else 
    echo -e "redis is already installed ..$Y SKIPPING $N" | tee -a $LOG_FILE
fi 

dnf list installed python3 &>>$LOG_FILE
if [ $? -ne 0 ]; then 
    dnf install python3 -y &>>$LOG_FILE
    VALIDATE $? "PYTHON"

else 
    echo -e "python is already installed ..$Y SKIPPING $N" | tee -a $LOG_FILE
fi 

