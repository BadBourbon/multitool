#!/bin/bash
#Defines the network address of the physical network port

if grep -qvP "^$" <<< $1;

then

  adapter_name=${1};

  if grep -qP "^\d+$" <<< $2;

    then
    
      iface_count=${2};
      
    else
      
      echo "Use ipbrut.sh --help for usage info";

    exit 1;

  fi

elif grep -qP -- "--help" <<< $1;

  then

    echo "sudo ipbrut.sh ADAPTER_NAME, IFACE_NAME";

  exit 0;

else

  echo "Use ipbrut.sh --help for usage info";

exit 1;

fi

for ((i = 1; i <= iface_count; i++));

  do

    ifconfig $adapter_name '192.168.'${i}'.10/24';

    ping 192.168.${i}.1 -c 1 -W 1 | grep -A1 statistics;

done
