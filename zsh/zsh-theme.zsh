parse_git_dirty () {
	setopt localoptions noshwordsplit
	local untracked_dirty=$1 dir=$2

	# use cd -q to avoid side effects of changing directory, e.g. chpwd hooks
	builtin cd -q $dir

	if [[ $untracked_dirty = 0 ]]; then
		command git diff --no-ext-diff --quiet --exit-code
	else
		test -z "$(command git status --porcelain --ignore-submodules -unormal)"
	fi

	return $?
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
function formatted_dir {
    initial=${$(pwd)/#$HOME/\~}
    end_string="${initial}"
    if [[ ${#end_string} -le 40 ]]; then
        echo ${end_string}
    else
        # requires extended_glob
        end_string=${end_string#(\~)#/}
        while [ ${#end_string} -gt 40 ]; do
            temp_end_string=${end_string#*/}
            if [ ${#end_string} = ${#temp_end_string} ]; then
                end_string=${temp_end_string}
                break
            fi
            end_string=${temp_end_string}
        done
        if [[ ${initial[1]} = "~" ]]; then
            echo "~/.../${end_string}"
        else
            echo "/.../${end_string}"
        fi
    fi
}
#local current_dir='${$(pwd)/#$HOME/~}'
local current_dir='$(formatted_dir)'

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

