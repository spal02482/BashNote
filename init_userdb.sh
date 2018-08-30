#!/bin/bash
init_userdb()
{
	while read p
	do
		arr=($p)
		users[${arr[0]}]=${arr[1]}
	done < $NOTEFILE
}
