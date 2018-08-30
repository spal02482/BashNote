#!/bin/bash
register_user()
{
	clear
	echo -n `tput cup 1 $(( $col / 2 - 24 ))` 'Username: '
	read username
	echo -n `tput cup 2 $(( $col / 2 - 24 ))` 'Password: '
	read -s password;echo ""
	flagr=0
	for i in ${!users[@]}
	do
		if [[ $i == $username ]]; then
				flagr=1
				break
		fi
	done
	if [[ $flagr == 1 ]];then 
		return 1
	else 
		echo "$username $password" >> $NOTEFILE
		return 0
	fi	
}
