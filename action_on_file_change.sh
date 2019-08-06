#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo "Usage: $0 monitored_file"
    exit 1
fi

FILE=$1

hash() { h=`md5sum $FILE | cut -d ' ' -f1`; }

hash;
c=$h; 

while [ 1 ]; do 
	sleep 1; 
	hash; 
	if [ "$h" != "$c" ]; then 
		### your action goes here:
		ls -l $FILE
		### 

		c=$h; 
	fi; 
done
