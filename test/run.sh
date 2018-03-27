#!/bin/bash
for i in 2 3 4 5 6 7 8
do
	echo -n $PATH | cut -z -d : -f $i;
	if [[ $i -eq 8 ]]; then
		break;
	fi
	echo -n ':';
done
echo 

