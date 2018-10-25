#!/bin/bash 

FOLDER=$1
COUNT=$2
START=0
if [ "$3" != "" ]; then
  $START=$3
fi

cd $FOLDER
mkdir temp
for i in `seq 1 $COUNT`;
do
echo "Start: " $START
echo "i: " $i
BRANCH_NUMBER=$(($START+$i))
echo "Branch number:" $BRANCH_NUMBER
BRANCH_NAME=script-branch-$BRANCH_NUMBER
echo "Branch name: " $BRANCH_NAME
git checkout -b $BRANCH_NAME
TIMESTAMP=`date`
FILE=temp/file$i.txt
touch $FILE
echo "Writing $i $TIMESTAMP into $FILE"
echo "$i $TIMESTAMP">> $FILE
git add -A
git commit -m "Small fix in $FILE"

done

git push --all -u