#!/bin/bash

DATE=$(date)
 echo "timestamp: $DATE"

 START_TIME=$(date +%S)

 END_TIME=$(date +%S)

 TOTAL_TIME=$(($END_TIME-$START_TIME))
 echo "Totaltime: $TOTAL_TIME"