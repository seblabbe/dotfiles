# some aliases
alias cd..="cd .."
alias c="clear"

# some more ls aliases
alias l='ls -CF'
alias ll='ls -AlF'
# alias ls='ls $LS_OPTIONS -hF'
# alias ll='ls $LS_OPTIONS -lAhF'

# alias for crontab
# http://drawohara.com/post/6344279/crontab-temp-file-must-be-edited-in-place
alias crontab="VIM_CRONTAB=true crontab"

# trouve du .cshrc du lirmm:
alias ff='/usr/bin/find . -name \!* -print'

# os dependant aliases
unamestr=`uname`
if [[ "$unamestr" == 'Linux' ]]; then
   # pour thales:
   alias dus='du -d1 -h'
   # open for ubuntu
   alias open='gnome-open'
elif [[ "$unamestr" == 'Darwin' ]]; then
   # pour mon mac:
   alias dus='du -ha --max-depth=1'
fi


