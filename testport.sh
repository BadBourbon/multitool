#!/bin/bash
#Displaying information about the operating modes of a physical network port
if grep -qvP "^$" <<< $1;

  then

    adapter_name=${1};

if grep -qP "^\d+$" <<< $2;

  then
      
    i=${2};

  else
      
    echo "Use test1.sh --help";

  exit 1;
  
fi

elif grep -qP -- "--help" <<< $2;

  then

    echo "sudo test1.sh ADAPTER_NAME IFACE_NUM" ;
  
  exit 0;

else

  echo "Use test1.sh --help for usage info";
 
exit 1;

fi

	ifconfig $adapter_name 192.168.${i}.100;

	route add default gw 192.168.$i.1;

	ping 192.168.${i}.100 -c 3;

	ifconfig | grep -e "inet";

	ethtool $adapter_name | grep -e "Speed": -e "Duplex";


