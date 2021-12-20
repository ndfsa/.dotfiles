setopt prompt_subst

precmd_functions+=( precmd_vcs_info )
case ${TERM} in
    linux*|screen*)
		PS1=' %F{5}%~%f %F{4}>%f '
		;;
esac
