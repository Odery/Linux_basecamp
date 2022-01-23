#!/bin/bash

#Check whether specified user is root
if [ "$2" == 'root' ]; then
    printf "Finding 'root' user data is not allowed!\n"
    exit 42
fi

#ANSI escape codes for color
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m'

#Using printf cause of extended functionality
printf "${GREEN}Located files and folders for the specified user:${NC} \n"

#Looping through find output to append with 'is found!'
for line in $(find $1 -user $2); do
    printf "$line ${GREEN}is found!${NC}\n" 
done

#Displaying all given user processes
printf "\n${RED}User processes:${NC}\n"
ps -u $2 -o pid,user,command > tempresult.tmp