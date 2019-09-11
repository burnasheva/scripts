#!/bin/bash

for i in {1..10000};
do
TIMESTAMP=`gdate "+%%Y-%%m-%%d %%H:%%M:%%S:%%N"`
echo "Writing $i $TIMESTAMP into file$i.txt"
echo "$i $TIMESTAMP">> file$i.txt
done
