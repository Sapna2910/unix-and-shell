#!/bin/sh

folder_path= "/home/ec2-user/Unix_and_shell/shell_scripts/*" 
dep="<artifactId>junit</artifactId>"

cd "$folder_path"

for f in *;
do
if [ -d $f ]
then
echo "$f"
cd "$f"
project_name=$( basename "$PWD" )
  if grep "$dep" pom.xml;
  then
  linenumber=`grep -n "$dep" pom.xml | sed 's/^\([0-9]\+\):.*$/\1/'`
  echo $linenumber
  startlinenumbertodelete=`head -n $linenumber pom.xml| grep -n "<dependency>" | tail -1 | sed 's/^\([0-9]\+\):.*$/\1/'`
  echo $startlinenumbertodelete
  templastlinenumbertodelete=`tail -n +$linenumber pom.xml | grep -n "</dependency>"| head -1|sed 's/^\([0-9]\+\):.*$/\1/'`
  echo $templastlinenumbertodelete
  lastlinenumbertodelete=`expr "$linenumber" + "$templastlinenumbertodelete" - 1`
  echo $lastlinenumbertodelete
  else
  echo "reached else"
  fi
fi
done
