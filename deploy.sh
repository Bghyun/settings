#!/bin/bash
NULL_CLR='\033[0m'
LGRN_CLR='\033[1;32m'
LRED_CLR='\033[1;31m'

# array of all targets 
targets=(
	'.bashrc'
	'.vimrc'
)

# keep track of which targets to deploy and which ones to skip
deploys=()
skips=()

# check to see if all targets are present first
for t in ${targets[@]}; do
	if [ ! -f $t ]; then
		echo "Target: $t does not exist, please add this target phyiscally or remove it from the targets list."
		exit 1
	fi
done

# deploy each target, asking the user explicitly each time a target
# file exists on the system already for permission to update the target.
for t in ${targets[@]}; do
	ANS='?'
	if [ -f ~/$t ]; then
		while [[ $ANS != 'y' && $ANS != '' && $ANS != 'n' ]]; do
			read -p "Target $t exists already, overwrite it? (y/[n]): " ANS
		done;
	else
		ANS='y'
	fi;

	# parse answer 
	if [[ $ANS == 'y' ]]; then
		deploys+=("$t")
	elif [[ $ANS == '' || $ANS == 'n' ]]; then
		skips+=("$t")
	else
		echo "Unexpected prompt answer: $ANS. Exiting script without any actions performed."
		return 2
	fi;
done

# deploy these ones
echo ''
for t in ${deploys[@]}; do
	echo -n "Deploying $t ... "
	cp $t ~/$t
	if [ $? -eq 0 ]; then
		echo -e "[${GRN_CLR}OK${NULL_CLR}]."
	else	
		echo -e "[${LRED_CLR}FAILED${NULL_CLR}]."
	fi;
done

