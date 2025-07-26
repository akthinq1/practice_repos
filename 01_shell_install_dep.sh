#!/bin/bash

echo $0
echo

user=$(id -u)

if [ $user != 0 ]
then 
    echo "error: please run the script with root user"
else
    echo "script started executing"
fi

echo $?

abcdddd

echo $?
# dnf install nginx -y