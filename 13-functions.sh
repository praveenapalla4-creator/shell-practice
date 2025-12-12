#!/bin/bash



USERID=$(id -u)
if [ $USERID -ne 0 ]; then
   echo "ERROR: Please run this script with root privilege"
   exit 1 # if we not use this then it will proceed with next lines
fi
dnf install mysql -y

if [ $? -ne 0 ]; then
   echo " ERROR: Installing mysql is fialure"
   exit 1
else
    echo "mysql is installed"
fi

dnf install redis -y

if [ $? -ne 0 ]; then
   echo " ERROR: Installing redis is fialure"
   exit 1
else
    echo "redis is installed"
fi

dnf install python -y

if [ $? -ne 0 ]; then
   echo " ERROR: Installing python3 is fialure"
   exit 1
else
    echo "python3 is installed"
fi
