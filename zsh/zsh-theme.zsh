parse_git_dirty () {
	local STATUS=''
	local FLAGS
	FLAGS=('--porcelain')
	if [[ "$(command git config --get oh-my-zsh.hide-dirty)" != "1" ]]
	then
		if [[ $POST_1_7_2_GIT -gt 0 ]]
		then
			FLAGS+='--ignore-submodules=dirty'
		fi
		if [[ "$DISABLE_UNTRACKED_FILES_DIRTY" = "true" ]]
		then
			FLAGS+='--untracked-files=no'
		fi
		STATUS=$(command git status ${FLAGS} 2> /dev/null | tail -n1)
	fi
	if [[ -n $STATUS ]]
	then
		echo "$ZSH_THEME_GIT_PROMPT_DIRTY"
	else
		echo "$ZSH_THEME_GIT_PROMPT_CLEAN"
	fi
}

git_prompt_info () {
	local ref
	ref=$(command git symbolic-ref HEAD 2> /dev/null)  || ref=$(command git rev-parse --short HEAD 2> /dev/null)  || return 0
	echo "$ZSH_THEME_GIT_PROMPT_PREFIX${ref#refs/heads/}$(parse_git_dirty)"
}

function virtualenv_info(){
    # Get Virtual Env
    if [[ -n "$VIRTUAL_ENV" ]]; then
        # Strip out the path and just leave the env name
        venv="${VIRTUAL_ENV##*/}"
    else
        # In case you don't have one activated
        venv=''
    fi
    [[ -n "$venv" ]] && echo "(venv:$venv) "
}

function zle-line-init zle-keymap-select {
    VIM_PROMPT="%{$fg_bold[yellow]%} [% NORMAL]% %{$reset_color%}"
    RPS1="${${KEYMAP/vicmd/$VIM_PROMPT}/(main|viins)/}"
    zle reset-prompt
}



setopt prompt_subst
function box_name {
		[ -f ~/.box-name ] && cat ~/.box-name || echo $HOST | cut -d . -f 1
}


# Directory info.
local current_dir='${$(pwd)/#$HOME/~}'

# Git info.

ZSH_THEME_GIT_PROMPT_PREFIX=" on $fg[white]git:$fg[cyan]"
ZSH_THEME_GIT_PROMPT_DIRTY=" $fg[red]x$reset_color"
ZSH_THEME_GIT_PROMPT_CLEAN=" $fg[green]o$reset_color"

local git_info='$(git_prompt_info)'
local dirty='$(parse_git_dirty)'

# Prompt format: USER@MACHINE DIRECTORY on REPO:BRANCH STATE [TIME] \n $
PROMPT="
%{$terminfo[bold]$fg[blue]%}%{$reset_color%}\
%{$fg[green]%}%n\
%{$fg[white]%}@\
%{$fg[red]%}$(box_name) \
%{$fg[white]%}\
%{$terminfo[bold]$fg[yellow]%}${current_dir}%{$reset_color%}\
${git_info} 
%{$terminfo[bold]$fg[red]%}$ %{$reset_color%}"

if [[ "$USER" == "root" ]]; then
PROMPT="
%{$terminfo[bold]$fg[blue]%}%{$reset_color%}\
%{$terminfo[bold]$fg[red]%}%n\
%{$fg[white]%}@\
%{$fg[green]%}$(box_name) \
%{$fg[white]%}\
%{$terminfo[bold]$fg[yellow]%}${current_dir}%{$reset_color%}\
${git_info} 
%{$terminfo[bold]$fg[red]%}$ %{$reset_color%}"

fi

