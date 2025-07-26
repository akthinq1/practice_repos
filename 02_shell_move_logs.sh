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

VALIDATE (){
    if [ $1 == 0 ]
    then
        echo $2... is success | tee -a $LOG_FILE
    else
        echo $2... is failure | tee -a $LOG_FILE
        exit 1
    fi
}

# dnf install nginx -y | tee -a $LOG_FILE

dnf install nginx -y &>>$LOG_FILE
VALIDATE $? "installing nginx"

# argument one is checking exit status $1=$?
# argument two in function is installing nginx $2=nginx