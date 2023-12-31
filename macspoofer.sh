#!/bin/bash
# simple spoofer adresse mac auto
# premier argument future adresse mac, prochain argument la durée en seconde

NIC=$1
TIME=$2

__supermagic() {

for (( ; ; ))
do
   magic=`tr -dc A-F0-9 < /dev/urandom | head -c 10 | sed -r 's/(..)/\1:/g;s/:$//;s/^/02:/'`
   sleep $TIME
   ifconfig $NIC down; ifconfig $NIC hw ether $magic ; ifconfig $NIC up
done
}
__supermagic