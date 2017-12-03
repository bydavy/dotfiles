# source .profile
if [ -r ~/.profile ]; then
	. ~/.profile
fi

# source .bashrc only if this is an interactive shell
case "$-" in
	*i*)
		if [ -r ~/.bashrc ]; then
			. ~/.bashrc
		fi
	;;
esac
