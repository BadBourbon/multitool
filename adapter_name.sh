#!/bin/bash
ifconfig | grep -i 'enp' | cut -d: -f 1  > nifter
