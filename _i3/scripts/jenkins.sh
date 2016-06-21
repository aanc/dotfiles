#!/bin/bash

SCRIPT_DIR=$(dirname $(readlink -f $0))
source $SCRIPT_DIR/_firefox.sh

wallURL="http://forge/ic/view/_FDXT_DSL/view/Exploitation/view/Wall/"
jobsURL="http://forge/ic/job/"

if [[ -z $BLOCK_BUTTON ]]; then
	wall=$(curl -s $wallURL | sed -e "s|</div>|</div>\n|g" | grep 'class="job' | sed -r -e 's|^.* class="job ([a-z]*) .*$|\1|')
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
else
	jobName=$(curl -s $wallURL | sed -e "s|</div>|</div>\n|g" | grep 'class="job' | sed -r -e 's|^.* tooltip="(.*)" .* class="job ([a-z]*) .*$|\2 \1|' | grep ^failing | cut -d" " -f2 | rofi -dmenu -no-fullscreen -font "DejaVu Sans Mono 10" -p "Failing jobs:" -padding 2 -location 3 -yoffset 24 -lines 5)
	[[ -n $jobName ]] && firefox::open_in_new_tab ${jobsURL}/${jobName}
fi
