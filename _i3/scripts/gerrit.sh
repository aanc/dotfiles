#!/bin/bash

count=$(curl -s 'http://git:8080/gerrit/changes/' | egrep -c '"project": "forge/forge-config-mgt"|"project": "forge/forge-jobs"')
if [[ $count -gt 0 ]]; then
	echo "$count Gerrits waiting"
	echo
	echo \#cc5b5b
else
	echo "No Gerrit waiting"
	echo
	echo \#6BC289
fi
