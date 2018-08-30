clear
echo -n `tput cup 1 $(( $col / 2 - 24 ))` 'Username: '
read user
echo -n `tput cup 2 $(( $col / 2 - 24 ))` 'Password: '
read -s pass;echo ""
echo $user $pass
