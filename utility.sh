#!/bin/bash
while true
do
	clear
	echo `tput cup $(( $row / 2 - 9 )) $(( $col / 2 - 15 ))` '1.List'
	echo `tput cup $(( $row / 2 - 8 )) $(( $col / 2 - 15 ))` '2.Read'
	echo `tput cup $(( $row / 2 - 7 )) $(( $col / 2 - 15 ))` '3.Create'
	echo `tput cup $(( $row / 2 - 6 )) $(( $col / 2 - 15 ))` '4.Delete'
	echo `tput cup $(( $row / 2 - 5 )) $(( $col / 2 - 15 ))` '5.SignOut'
	echo -n `tput cup $(( $row / 2 - 4 )) $(( $col / 2 - 15 ))` 'Enter Choice:'
	read c
case $c in 
	1) 
		n=$(ls $NOTEPATH/$username | wc -l)
		if [[ $n -ne 0 ]];then
			ls $NOTEPATH/$username
			read btm
		else
			echo "No files yet..."
			sleep 0.7
		fi
		;;
	2)
		echo -n "Enter filename:"
		read filename
		ls $NOTEPATH/$username/$filename &> /dev/null
		if [[ $? -eq 0 ]];then
			vim $NOTEPATH/$username/$filename
		else
			echo "file doesn't exist..."
			sleep 0.7
		fi
		;;
	3)
		echo -n "Enter filename:"
		read filename
		ls $NOTEPATH/$username/$filename &> /dev/null
		if [[ $? -ne 0 ]];then
			vim $NOTEPATH/$username/$filename
		else
			echo "file already exists with this name..."
			sleep 0.7
		fi
		;;
	4)
		echo -n "Enter filename:"
		read filename
		ls $NOTEPATH/$username/$filename &> /dev/null
		if [[ $? -eq 0 ]];then
			rm $NOTEPATH/$username/$filename
			if [ $? -eq 0 ];then 
				echo "file $filename successfully deleted..."
				sleep 0.7
			fi
		else
			echo "file doesn't exist,so not deleted..."
			sleep 0.7
		fi
		;;
	5)
		clear
		break
		;;
	esac
done
		