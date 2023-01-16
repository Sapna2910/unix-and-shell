#!/bin/sh

echo "enter repo name: "
read reponame
echo "enter username: "
read uname
echo "enter password : "
read -s password

present_date=`date +'%s'`
list_of_branches=$(curl -s -u $uname:$password https://api.github.com/repos/$uname/$reponame/branches | jq '.[].name')

for branch in $list_of_branches;
do
bname=$(echo $branch | cut -d '"' -f 2)
echo "$bname"
last_update_date=$(curl -s -u $uname:$password https://api.github.com/repos/$uname/$reponame/branches/$bname | jq '.commit.commit.author.date' | cut -d'"' -f 2)
last_update_date_sec=$(date -d $last_update_date +%s)
nod=$((($present_date-$last_update_date_sec)/(60*60*24)))

if [ $nod -gt 60 ] ;
then
echo "Branch $bname is updated $nod days back"
fi
done
