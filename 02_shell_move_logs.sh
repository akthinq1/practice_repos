#!/bin/bash

USER=$(id -u)
LOGS_FOLDER="/var/log/shell_logs"
SCRIPT_NAME="$(echo $0 | cut -d "." f1)"
LOG_FILE="LOGS_FOLDER/SCRIPT_NAME.log"

if [ $user != 0 ]
then
    echo "run user with root access"
else
    echo "script started executing"
fi

mkdir -p $LOGS_FOLDER &>>$LOG_FILE

dnf install nginx -y | tee -a $LOG_FILE