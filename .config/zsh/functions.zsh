## Add sudo to the start of the command
sudo-command-line() {
	[[ -z $BUFFER ]] && zle up-history
	if [[ $BUFFER == sudoedit\ * ]]; then
		LBUFFER="nvim ${LBUFFER#sudoedit }"
	elif [[ $BUFFER == sudo\ * ]]; then
		LBUFFER="${LBUFFER#sudo }"
	elif [[ $BUFFER == nvim\ * ]]; then
		LBUFFER="sudoedit ${LBUFFER#nvim }"
	else
		LBUFFER="sudo $LBUFFER"
	fi
}

zle -N sudo-command-line
