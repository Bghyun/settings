
# aliases 
alias ls='ls --color=auto'
alias vi='vim'

# terminal colors. example usage:
#
# echo -e "${RED_CLR}This text is in red${NULL_CLR}. This is not"
# -e is required to interpret backslashes 
export NULL_CLR='\033[0m'
export RED_CLR='\033[0;31m'
export BLU_CLR='\033[0;34m'
export GRN_CLR='\033[0;32m'
export CYN_CLR='\033[0;36m'
export YLW_CLR='\033[0;33m'

export LGRN_CLR='\033[1;32m'
export LRED_CLR='\033[1;31m'
export WHT_CLR='\033[1;37m'

# other stuff
export DISPLAY=":0.0"

# initialize empty git repository
function gitinit() {
	if [ $# -ne 1 ]; then
		echo 'Usage: gitinit <repository_name>'
	else
		git init --bare $1
	fi
}

#
# Output IPv4 address of computer.
#
# Retrieve via: 'https://www.ipify.org/'
# At the time of this writing (04/13/2017), Ipify
# has no restriction on number of IP query calls.
#
function myip() {
	result=$(curl -s 'https://api.ipify.org');
	echo $result
	return 0;
}

#
# Echoes each path in environment variable PATH
# in its own line for easy readability.
#
function echopath() {
	local oldIFS=$IFS
	IFS=':'
	for path in $PATH; do
		echo $path
	done	
	IFS=$oldIFS
	return 0;
}

# custom bashrc for host-dependent paths etc
if [ -f ~/local/.bashrc ]; then
	source ~/local/.bashrc
fi

