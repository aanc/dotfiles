#!/bin/bash

wall=$(curl -s http://forge/ic/view/_FDXT_DSL/view/Exploitation/view/Wall/ | sed -e "s|</div>|</div>\n|g" | grep 'class="job' | sed -r -e 's|^.* class="job ([a-z]*) .*$|\1|')
[[ -z $wall ]] && echo "Jenkins" && echo && echo \#d03f3f

total=$(wc -l <<< $wall)
failed=$(egrep -o "failing|claimed" <<< $wall | wc -l)

if [[ $failed -gt 0 ]]; then
	echo "Jenkins:$failed KO"
	echo
	echo \#cc5b5b
else
	echo 'Jenkins:OK'
	echo
	echo \#6BC289
fi
