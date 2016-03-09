#!/bin/bash

wall=$(curl -s http://forge/ic/view/_FDXT_DSL/view/Exploitation/view/Wall/ | sed -e "s|</div>|</div>\n|g" | grep 'class="job' | sed -r -e 's|^.* class="job ([a-z]*) .*$|\1|')
[[ -z $wall ]] && echo "unreachable" && echo && echo \#d03f3f

total=$(wc -l <<< $wall)
failed=$(grep -c failing <<< $wall)

if [[ $failed -gt 0 ]]; then
	echo "$failed KO"
	echo
	echo \#cc5b5b
else
	echo "OK"
	echo
	echo \#6BC289
fi
