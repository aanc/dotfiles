#!/bin/bash

if ip a show tun0 &>/dev/null
then
	echo "VPN:Up"
	echo
	echo \#6BC289
else
	echo "VPN:Down"
	echo
	echo \#cc5b5b
fi


