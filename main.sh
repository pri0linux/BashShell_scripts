RED="\e[31m"
GREEN="\e[32m"
ENDCOLOR="\e[0m"

log=/var/tmp/scripts/logfile
cat /dev/null > $log

for i in $(cat /var/tmp/scripts/servernames)
do
ping -c 1 $i &> /dev/null
        if [[ $? != 0 ]]
        then
                 echo "$i server is down." >> $log
        else
                rsync -auzh /var/tmp/scripts/usercheckscript.sh ansible@$i:/var/tmp/
                rsync -auzh /var/tmp/scripts/users ansible@$i:/var/tmp/
                ssh $i "cat /dev/null > /var/tmp/$i.txt"
                ssh $i "sh /var/tmp/usercheckscript.sh" >> $log
                rsync -auzh ansible@$i:/var/tmp/$i.txt /var/tmp/scripts/$i.txt
        fi
done

cat $log