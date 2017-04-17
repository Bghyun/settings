
# aliases 
alias ls='ls --color=auto'
alias vi='vim'

# other stuff
export DISPLAY=:0.0

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

