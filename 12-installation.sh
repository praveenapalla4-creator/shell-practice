#!/bin/bash

USERID=$(id -u)
if [ $USERID -ne 0 ]; then
   echo "ERROR: Please run this script with root privilege"
   exit 1 # if we not use this then it will proceed with next lines
fi

dnf install mysql -y

if [ $? -ne 0 ]; then
   echo " ERROR: Installing MYSQL is fialure"
   exit 1
else
    echo "MYSQL is installed"
fi