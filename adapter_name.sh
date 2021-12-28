#!/bin/bash
#Parsing the name of the network adapter and places it in the nifter file
ifconfig | grep -i 'enp' | cut -d: -f 1  > nifter
