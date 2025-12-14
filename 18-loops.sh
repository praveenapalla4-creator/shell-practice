#!/bin/bash


USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
LOGS_FOLDER="/var/log/shell-script"
SCRIPT_NAME=$( echo $0 | cut -d "." -f1)
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME.log"

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
    echo -e "$2 ... $G is installed $N" | tee -a $LOG_FILE
fi

}
for package in $@
do
dnf list installed $package &>>$LOG_FILE
if [ $? -ne 0 ]; then 
    dnf install $package -y &>>$LOG_FILE
    VALIDATE $? "$package"
else 
    echo -e "$package is already installed ..$Y SKIPPING $N" | tee -a $LOG_FILE
fi 
done


