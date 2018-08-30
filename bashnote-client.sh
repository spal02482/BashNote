#!/bin/bash
echo -n "Enter the Host IP:"; read ip
echo -n "Enter Remote Host Username:"; read user
echo -n "Enter the Host Password:"; read pass
sshpass -p $pass ssh -t $user@$ip 'cd ~/Github/BashNote && bash note.sh'
# sshpass provides ssh which is in keyboard interactive mode password in non-interactive mode
# -t option allocates a pseudo tty for ssh
# 'cd ~/Github/BashNote && bash note.sh' first changes the directory and executes note.sh by remaining in that directory
# cd scripts;bash note.sh will give an error that note.sh does not exist cause it searches for that in home directory.

