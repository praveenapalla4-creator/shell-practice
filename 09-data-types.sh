#!/bin/bash

NUMBER1=100
NUMBER2=200
NAME=DevOps

SUM=$(($NUMBER1+$NUMBER2+$NAME))
echo "Sum is : ${SUM}"

LEADERS=("Modi","Babu","Jagan")
echo "All Leader: ${LEADERS[@]}"
echo "First Learder: ${LEADERS[0]}"
echo "Second Leader: ${LEADERS[10]}"