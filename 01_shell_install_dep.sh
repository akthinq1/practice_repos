#!/bin/bash


user=$(id-u)

if [ $user -nq 0 ]
then 
    echo "error: please run the script with root user"
else
    echo "script started executing"
fi

echo $0

$!

abcdddd

$!
# dnf install nginx -y