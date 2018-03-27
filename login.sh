login_user()
{
	clear
	echo -n `tput cup 1 $(( $col / 2 - 24 ))` 'Username: '
	read username
	echo -n `tput cup 2 $(( $col / 2 - 24 ))` 'Password: '
	read -s password;echo ""
	flagl=0
	for i in ${!users[@]}
	do
		if [[ $i == $username ]]; then
			if [[ ${users[$i]} == $password ]];then
				flagl=1
				break
			fi
		fi
	done
	if [[ $flagl == 1 ]];then 
		return 0
	else 
		return 1
	fi
}