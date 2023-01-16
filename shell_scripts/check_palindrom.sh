#!/bin/sh -x


echo "this program is being executed by $(who) at $(date) in directory $( basename "$PWD" )"

read origStr<<<$1
echo "length of string is ${#origStr}"

for i in $(seq 0 ${#origStr})
do
	revStr=${origStr:$i:1}${revStr}
done

echo "input string was : ${origStr}"
echo "reverse string is : ${revStr}"

if [ "${origStr}" = "${revStr}" ]
then

	echo "strings are palindrom"
else
	echo "strings are not palondrom"

fi

