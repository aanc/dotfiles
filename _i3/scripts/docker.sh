#!/bin/bash

status=$(systemctl status docker | grep Active | awk '{print $2}' | sed -e "s/^active$/Started/" -e "s/^inactive$/Stopped/")

echo "($(docker ps -q 2>/dev/null | wc -l))"
echo
if [[ $status == Started ]]; then
  echo \#3d9c77
else
  echo \#d03f3f
fi
