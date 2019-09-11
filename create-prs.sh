#!/bin/bash 

# run ./create-prs.sh <PATH> <COUNT> (<TARGET_BRANCH>) (<START_NUMBER>)
FOLDER=$1
COUNT=$2

TARGET=master
if [ "$3" != "" ]; then
  TARGET=$3
fi

START=0
if [ "$4" != "" ]; then
  START=$4
fi
echo "Start: " $START

cd $FOLDER
mkdir prs
for i in `seq 1 $COUNT`;
do
echo "i: " $i
BRANCH_NUMBER=$(($START+$i))
echo "Branch number:" $BRANCH_NUMBER
BRANCH_NAME=script-branch-pr-$BRANCH_NUMBER
echo "Branch name: " $BRANCH_NAME
git checkout -b $BRANCH_NAME
TIMESTAMP=`date`
FILE=prs/file$i.txt
touch $FILE
echo "Writing $i $TIMESTAMP into $FILE"
echo "$i $TIMESTAMP">> $FILE
git add -A
git commit -m "Small change in $FILE"
echo "Successfully committed change in $BRANCH_NAME"
git push --set-upstream origin $BRANCH_NAME
echo "Successfully pushed branch $BRANCH_NAME"
hub pull-request -f --base $TARGET --head $BRANCH_NAME --message "generated PR #$1 (from $BRANCH_NAME to $TARGET)"
echo "Successfully created PR for branch $BRANCH_NAME"
done
