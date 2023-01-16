#!/bin/sh


folder_path= "/home/ec2-user/Unix_and_shell/shell_scripts/" 
dep="<artifactId>junit</artifactId>"

echo "$folder_path"
cd "$folder_path"
for f in *
do
echo $f	
if [ -d $f ]
then
cd $f
ls
project_name=$( basename "$PWD")
echo "$project_name"
if grep "$dep" pom.xml
then
linenum=`grep -n "$dep" pom.xml | sed 's/^\([0-9]\+\):.*$/\1/'`
echo "$linenum"
startnum=`head -n $linenum pom.xml | grep -n "<dependency>" | tail -1 | sed 's/^\([0-9]\+\):.*$/\1/'`
echo "$startnum"
endnum=`tail -n +$linenum pom.xml | grep -n "</dependency>"| head -1|sed 's/^\([0-9]\+\):.*$/\1/'`
echo "$endnum"
else
echo "not found"
fi
else
echo "not a dir"
fi
done
