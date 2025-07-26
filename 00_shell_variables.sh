#!/bin/bash

HELLO="Hello worlid!"

echo $HELLO

echo "exit status"
echo $?

echo "PID of current script"
echo $$

sleep 40&
echo "PID of last command running on background"
echo $!

echo "srcipt name"
echo $0