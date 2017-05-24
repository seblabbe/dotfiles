# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

############
# Prompt
############

# \u : user
# \h : host
# \W : directory
# \w : complete path to directory
# 31=rouge, 32=vert, 33=jaune
# couleur: \[\e[33m\]something\[\e[m\]

# a basic one
# export PS1="\u@\h \W \\$ "

# with color
# export PS1="\[\e[33m\]\u@\h \W \\$ \[\e[m\]"

# with git stuff
# see ezprompt.net for the missing code
# export PS1="\u@\h \W\`parse_git_branch\` \\$ "

# Another one
# Couleurs du préfix du terminal (dark)
# NM="\[\033[0;38m\]" 
# HI="\[\033[0;37m\]" 
# HII="\[\033[0;36m\]" 
# SI="\[\033[0;33m\]"
# IN="\[\033[0m\]"
# Couleurs du préfix du terminal (light)
# NM="\[\033[0;0m\]" 
# HI="\[\033[0;37m\]" 
# HII="\[\033[0;36m\]" 
# SI="\[\033[0;33m\]"
# IN="\[\033[0m\]"
# export PS1="$NM[ $HI\u $HII\h $SI\w$NM ] $IN"
# export PS1="$HI\u@\h $SI\w$NM $IN$ "

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;33m\]\u@\h\[\033[00m\] \[\033[01;34m\]\W\[\033[00m\] \$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h \W \$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

#####################################
# Mes modifications (13 avril 2015)
#####################################

# Applications/bin
export PATH=~/Applications/bin:$PATH
export PATH=~/bin:$PATH
export PATH=~/GitBox/scripts:$PATH
export PATH=~/GitBox/sage:$PATH

# MacPorts Installer addition on 2015-11-24_at_23:19:20: adding an appropriate PATH variable for use with MacPorts.
unamestr=`uname`
if [[ "$unamestr" == 'Darwin' ]]; then
   export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
   # Finished adapting your PATH environment variable for use with MacPorts.
fi

# Add Gurobi to the PATH according to its documentation
# file:///opt/gurobi702/linux64/docs/quickstart_linux/software_installation_guid.html
if [ -d /opt/gurobi702/linux64 ]; then
   echo "Found Gurobi 7.02: adding it to the paths..."
   export GUROBI_HOME="/opt/gurobi702/linux64"
   export PATH="${PATH}:${GUROBI_HOME}/bin"
   export LD_LIBRARY_PATH="${LD_LIBRARY_PATH}:${GUROBI_HOME}/lib"
fi
