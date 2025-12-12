#!/bin/bash

#!/bin/bash

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

if [ $USERID -ne 0 ]; then
   echo -e "ERROR: Please run this script with root privilege"
   exit 1 # if we not use this then it will proceed with next lines
fi

VALIDATE(){
    if [ $1 -ne 0 ]; then
   echo  -e " ERROR: Installing $2  ... $R is fialure $N"
   exit 1
else
    echo -e "$2 ... $R is installed $N"
fi

}

dnf list installed mysql
if [ $? -ne 0 ]; then 
    dnf install mysql -y
    VALIDATE $? "MYSQL"
else 
    echo -e "MYSQL is already installed ..$Y SKIPPING $N"
fi 

dnf list installed redis
if [ $? -ne 0 ]; then 
   dnf install redis -y
VALIDATE $? "REDIS"
else 
    echo -e "redis is already installed ..$Y SKIPPING $N"
fi 

dnf list installed python
if [ $? -ne 0 ]; then 
    dnf install python -y
    VALIDATE $? "PYTHON"

else 
    echo -e "python is already installed ..$Y SKIPPING $N"
fi 

