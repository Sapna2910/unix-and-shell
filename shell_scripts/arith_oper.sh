#!/bin/sh

read -p "enter num1 : " num1
read -p "enter num2 : " num2
read -p "enter oprtr : " oprtr


#case "$3" in
#	+) 
echo "add numbers"
val=`expr "$num1" + "$num2"`
echo "result is : $val"


