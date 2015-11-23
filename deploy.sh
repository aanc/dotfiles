#!/bin/bash

rl=readlink
[[ $(uname) == Darwin ]] && rl=greadlink	# OSX compatibility - needs coreutils installed
scriptDir=$(dirname $($rl -f $0))

echo "Deploying configuration:"
find $scriptDir -maxdepth 1 -name "_*" | while read file
do
	dotName=$(sed "s/_/./" <<< $(basename $file))
	echo -n "    - $dotName ... "
	if [[ -f ~/$dotName || -d ~/$dotName ]]; then
		echo "already exist"
		alreadyExist=1
	else
		ln -s $file ~/$dotName
		[[ $? -eq 0 ]] && echo "OK" || echo "Error"
	fi
done
