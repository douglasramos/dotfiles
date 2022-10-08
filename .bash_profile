# BASIC CONFIGURATION
#   ------------------------------------------------------------
export PATH="/usr/local/bin:/usr/local/sbin:~/bin:$PATH"
export PATH="/usr/local/bin:$PATH"
export PATH="/usr/bin:$PATH"
export PATH="/usr/local/bin:$PATH"

# NUCLI PATH
export NU_HOME="${HOME}/dev/nu"
export NUCLI_HOME="${NU_HOME}/nucli"
export PATH="${NUCLI_HOME}:${PATH}"

# Git branch in prompt.
parse_git_branch() {
 while read -r branch; do
     [[ $branch = \** ]] && current_branch=${branch#* }
 done < <(git branch 2>/dev/null)

 [[ $current_branch ]] && printf ' [%s]' "$current_branch"
}

# Modify Bash Prompt
export PS1="-->\[\033[36m\]\u\[\033[m\]@\[\033[32m\]nubank:\[\033[33;1m\]\w\[\033[m\]\$(parse_git_branch)\$ "
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad
export EDITOR=/usr/bin/vim
export LC_CTYPE='en_US.UTF-8'

# ALIAS
alias ls='ls -la'
alias cp='cp -iv'                           # Preferred 'cp' implementation
alias mv='mv -iv'                           # Preferred 'mv' implementation
alias mkdir='mkdir -pv'                     # Preferred 'mkdir' implementation
alias cd..='cd ../'                         # Go back 1 directory level (for fast typers)
alias ..='cd ../'                           # Go back 1 directory level
alias ...='cd ../../'                       # Go back 2 directory levels
alias .3='cd ../../../'                     # Go back 3 directory levels
alias .4='cd ../../../../'                  # Go back 4 directory levels
alias .5='cd ../../../../../'               # Go back 5 directory levels
alias .6='cd ../../../../../../'            # Go back 6 directory levels
alias f='open -a Finder ./'                 # f:            Opens current directory in MacOS Finder
alias ~="cd ~"                              # ~:            Go Home
alias c='clear'                             # c:            Clear terminal display
alias path='echo -e ${PATH//:/\\n}'         # path:         Echo all executable Paths
alias show_options='shopt'                  # Show_options: display bash options settings

# System shortcuts
alias flushdns='sudo dscacheutil -flushcache;sudo killall -HUP mDNSResponder;say cache flushed'
alias sha1='/usr/bin/openssl sha1'
alias md5='md5 -r'
alias md5sum='md5 -r'
alias running_services="sudo lsof -nPi -sTCP:LISTEN"
alias whatismyipaddress='dig +short myip.opendns.com @resolver1.opendns.com'
alias localip='ipconfig getifaddr en0'
alias chrome='open -a "Google Chrome" --args --user-data-dir=/tmp/chrome-$((1 + RANDOM % 10))'

# Utils
alias uuid="python -c 'import sys,uuid; sys.stdout.write(str(uuid.uuid4()))' | pbcopy && pbpaste && echo"

# History handling
export HISTCONTROL=erasedups # Erase duplicates
export HISTSIZE=10000 # resize history size
shopt -s histappend # append to bash_history if Terminal.app quits

# GIT
git config --global color.diff auto
git config --global color.status auto
git config --global color.branch auto

## get top process eating memory
alias psmem='ps aux | sort -nr -k 4'
alias psmem10='ps aux | sort -nr -k 4 | head -10'

## get top process eating cpu ##
alias pscpu=' ps aux | sort -nr -k 3 '
alias pscpu10=' ps aux | sort -nr -k 3 | head -10 '

# Bash autocomplete
[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion 
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
