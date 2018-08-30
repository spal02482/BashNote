#!/bin/bash
clear
NOTEFILE=users.txt
NOTEPATH=./notes
declare -A users
source init_userdb.sh
source login.sh
source register.sh
source delete.sh
init_userdb
while true
do
	col=`tput cols`
	row=`tput lines`
	echo `tput cup 1 $(( $col / 2 - 15 ))` 'Welcome to BashNote'
	echo `tput cup $(( $row / 2 - 9 )) $(( $col / 2 - 15 ))` '1.Login'
	echo `tput cup $(( $row / 2 - 8 )) $(( $col / 2 - 15 ))` '2.Register'
	echo `tput cup $(( $row / 2 - 7 )) $(( $col / 2 - 15 ))` '3.Delete'
	echo `tput cup $(( $row / 2 - 6 )) $(( $col / 2 - 15 ))` '4.Quit'
	echo -n `tput cup $(( $row / 2 - 5 )) $(( $col / 2 - 15 ))` 'Enter Choice:'
	read choice
	case $choice in 
		1)
			username=""
			login_user
			if [[ $? -eq 0 ]]; then
				echo "Succesfully Logged In..."
				sleep 0.7;clear
				source utility.sh
			else
				echo "Incorrect Login..."
				sleep 0.7;clear
			fi
			;;
		2)
			username=""
			register_user
			if [[ $? -eq 0 ]] ; then
				echo "Successfully Registered User in Database..."
				mkdir $NOTEPATH/$username
				if [ $? -eq 0 ]; then
					echo "Directory Successfully Created..."
					sleep 1;clear
				fi
			else
				echo "User Already Exists..."
				sleep 0.7;clear
			fi
			init_userdb
			;;
		3)
			username=""
			delete_user
			if [[ $? -eq 0 ]]; then
				echo "Successfully User deleted...Restart to take the effect change..." # It's a bug. I don't know why it's happening
				rm -rf $NOTEPATH/$username
				if [ $? ];then
					echo "Directory Succesfully Deleted..."
					sleep 1;clear
				fi
			else														 # But restarting fixes it.
				echo "User does not exist, So not deleted..."
				sleep 0.7;clear
			fi
			init_userdb
			;;
		4)
			clear
			break
			;;
	esac
done
