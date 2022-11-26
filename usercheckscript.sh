#!/bin/bash

RED="\e[31m"
GREEN="\e[32m"
ENDCOLOR="\e[0m"
#log=/var/tmp/scripts/logfile
#cat /dev/null > $log
hostname="'hostname'.txt"
cat /dev/null > $hostname

cat /etc/passwd | egrep -i "ansible" &> /dev/null
if [ $? != 1 ]; then
      time6="`last ansible | grep -i "wtmp" |awk -F' ' '{print $4,$5,$6,$7,$8}'`"
      echo -e "\nansible user is ${GREEN} Available ${ENDCOLOR} and last login time : "$time6"\n"
else
      echo -e "\nansible user is ${RED} Not Available ${ENDCOLOR} \n"
fi | tee -a /var/tmp/`hostname`.txt

for j in $(cat /var/tmp/users)
do
cat /etc/passwd | grep $j &> /dev/null
  if [[ $? != 1 ]]; then
        time1="`last $j |awk -F' ' '{print $3,$4,$5,$6,$7} '`"
        echo -e "\n$j user is ${GREEN} Available ${ENDCOLOR} and last login time : "$time1"\n"
  else
        echo -e "\n$j user is ${RED} Not Available ${ENDCOLOR} \n"
  fi
done | tee -a /var/tmp/`hostname`.txt
#cat $log