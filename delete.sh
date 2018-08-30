#!/bin/bash
delete_user()
{
	clear
	echo -n `tput cup 1 $(( $col / 2 - 24 ))` 'Username: '
	read username
	echo -n `tput cup 2 $(( $col / 2 - 24 ))` 'Password: '
	read -s password; echo ""
	flagd=0
	for i in ${!users[@]}
	do
		if [[ $i == $username ]]; then
			if [[ ${users[$i]} == $password ]]; then
				flagd=1
				break
			fi
		fi
	done
	if [[ $flagd -eq 1 ]]; then
		sed -i "/$username/d" $NOTEFILE
		return 0
	else
		return 1
	fi
}