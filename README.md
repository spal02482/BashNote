# BashNote
BashNote is a simple script written entirely in bash, which keeps your text files over a Server and can be accessed through a client script using ssh protocol.
It provide facilities like:
 - Login User
 - Register User
 - Delete User
 - Quit
 Once the Login process is successful, you can see your files, read your 
 files, create a new file, delete your files and sign out of it.

## Usage

 1. First, run bashnote-server.sh on the server side. It will check 
 for installation of openssh-server and check whether the 
 service is running or not.  
 `./bashnote-server.sh`  
 2. Then, run bashnote-client.sh on the client side, and it will ask for 
 server's IP address, User Name and the Password.  
 `./bashnote-client.sh`  
 Make sure that both of the files are in Executable mode.
 
## Tools and Utilities used:
Used ssh to create connection of client with the server.
grep, sed and awk for text processing tasks.
sshpass to feed the password to ssh in non-interactive mode which is in by default in interactive mode.
 
