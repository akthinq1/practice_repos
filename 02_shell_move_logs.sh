#!/bin/bash

USER=$(id -u)
LOGS_FOLDER="/var/log/shell_logs"
SCRIPT_NAME="$(echo $0 | cut -d "." -f1)"
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME.log"

if [ $USER != 0 ]
then
    echo "run user with root access"
    exit 1
else
    echo "script started executing"
fi

mkdir -p $LOGS_FOLDER

# dnf install nginx -y | tee -a $LOG_FILE

dnf install nginx -y &>>$LOG_FILE