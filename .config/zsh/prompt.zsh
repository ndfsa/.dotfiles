setopt prompt_subst

precmd_vcs_info() {
    vcs_wrapper=""
    [[ $(git rev-parse --is-inside-work-tree 2> /dev/null) != true ]] && return
	sts=$(git status --porcelain=1 2> /dev/null)
	staged=""
	unstaged=""
	untracked=""
	[[ -n $(echo "$sts" | rg "^[AMD]") ]] && staged=" %F{2}$icon_dot%f"
	[[ -n $(echo "$sts" | rg "^\\s[MD]") ]] && unstaged=" %F{3}$icon_dot%f"
	[[ -n $(echo "$sts" | rg "^\\?\\?") ]] && untracked=" %F{1}$icon_dot%f"

	branch=$(git branch --show-current 2> /dev/null)
	if [[ -n $branch ]]; then
		branch="%F{6} $icon_branch $branch%f"
	else
		branch=$(git describe --tags --exact-match 2> /dev/null)
		if [[ $branch ]]; then
			branch="%F{6} $icon_tag $branch%f"
		else
			branch="%F{6} $icon_commit $(git rev-parse --short HEAD 2> /dev/null)%f"
		fi
	fi
	vcs_wrapper="$branch$staged$unstaged$untracked"
}


precmd_functions+=( precmd_vcs_info )
case ${TERM} in
    linux*|screen*)
		icon_branch='[b]'
		icon_tag='[t]'
		icon_commit='[c]'
		icon_dot='*'
		PS1=' %F{5}%~%f${vcs_wrapper} %F{4}>%f '
		;;
esac
