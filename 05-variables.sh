#!/bin/bash

echo "Please enter your pin"
read  PIN_NUMBER # without -s it will show the password we are typin on the screen whihc is not goot in case od security

read -s PIN_NUMBER

echo "entered oin number is : $PIN_NUMBER" ## testing kosam print chesam but genral ga passwrd or pin number ila pritn cheyyamu