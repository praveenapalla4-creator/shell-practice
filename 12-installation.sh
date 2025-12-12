#!/bin/bash

USERID=$(id -u)
if [ $USERID -ne 0 ]; then
   echo "ERROR: Please run this script with root privilege"
fi

dnf install mysql -y

if [ $? -ne 0 ]; then
   echo " ERROR: Installing MYSQL is fialure"
else
    echo "MYSQL is installed"
fi