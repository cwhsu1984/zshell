#######################################################################
### PATH
#######################################################################
export PATH="$PATH:$HOME/bin"

#######################################################################
### Language
#######################################################################
export LANG=en_US.UTF-8
export LC_TIME=en_US.UTF-8
export LC_MESSAGES=en_US.UTF-8

#######################################################################
### Applications
#######################################################################
if [[ $(uname) == "FreeBSD" ]]; then
    export LSCOLORS "GxFxCxDxBxEGEDABAGACAD"
    alias ls="/bin/ls -FAwo"
    alias la="/bin/ls -FAwo"
    alias ll="/bin/ls -l"
    alias ld="/bin/ls -ld"
    alias lh="/bin/ls -lh"
    alias l="/bin/ls -CF"
elif [[ $(uname) == "Linux" ]]; then
    # ls
    export LS_COLORS='no=00:fi=00:di=00;36:ln=01;35:pi=40;33:so=01;32:bd=40;33;01:cd=40;33;01:or=01;34;43:mi=01;33:ex=01;31:*.cmd=01;32:*.exe=01;32:*.com=01;32;32:*.btm=01;32:*.bat=01;32:*.sh=01;32:*.csh=01;32:*.tar=01;31:*.tgz=01;04;35:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.bz=01;31:*.tz=01;31:*.rpm=01;31:*.cpio=01;31:*.jpg=01;35:*.gif=01;35:*.bmp=01;35:*.xbm=01;35:*.xpm=01;35:*.png=01;35:*.tif=01;35:'
    alias ls='ls --color=auto'
    alias la='ls -FA --color=auto'
    alias ll='ls -l --color=auto'
    alias ld='ls -ld --color=auto'
    alias lh='ls -lh --color=auto'
    alias l='ls -CF --color=auto'
    # grep
    export GREP_OPTIONS='--color=always'
    alias grep='LANG=C grep'
    # less
    ## make less more friendly for non-text input files, see lesspipe(1)
    [ -x /usr/bin/lesspipe ] && eval "$(lesspipe)"
elif [[ $(uname) == "Darwin" ]]; then
    export LSCOLORS "GxFxCxDxBxEGEDABAGACAD"
    alias ls='ls -Gv'
fi

# path alias, e.g. cd ~XXX
#hash -d WWW="/home/lighttpd/html"

alias '..'='cd ..'
alias -g ...='../..'
alias -g ....='../../..'
alias -g .....='../../../..'
alias -g ......='../../../../..'
alias -g .......='../../../../../..'
alias -g ........='../../../../../../..'
alias cd..='cd ..'
alias cd...='cd ../..'
alias cd....='cd ../../..'
alias cd.....='cd ../../../..'
alias cd......='cd ../../../../..'
alias cd.......='cd ../../../../../..'
alias cd........='cd ../../../../../../..'

alias cp='cp -i'
alias mv='mv -i'
alias vm='mv'
alias sl='ls'
alias rm='rm -i'
alias grep='LC_CTYPE=C grep'
#alias less='less -X'
alias rdesktop='rdesktop -P -z'
alias openproj='vim +SrcExplToggle +Project'
alias t='task'
unalias tmux >& /dev/null
#[[ $TERM == "xterm" ]] && [[ $TERM != "screen" ]] && [[ -s $(\which tmux) ]] && TERM=xterm-256color tmux && exit
alias tmux='TERM=xterm-256color tmux'
alias history='fc -l 1'

export EDITOR=vim
export SVN_EDITOR=vim

export PAGER=less
export MANPAGER='less -r'
export GIT_PAGER='less -r'
export ACK_PAGER='less -r'
#export LESS='-XRF'
#export LESS='-RF'
export LESS='-r'
# export LESS='-i'     # git diff unhappy


#######################################################################
### HISTORY
#######################################################################
export HISTIGNORE="&:ls:[bf]g:exit:reset:clear:cd:cd ..:cd.."
# number of lines kept in history
export HISTSIZE=10000
# number of lines saved in the history after logout
export SAVEHIST=10000
# location of history
export HISTFILE=~/.zsh_history
# append command to history file once executed
setopt INC_APPEND_HISTORY
# Do not enter command lines into the history list if they are duplicates of the previous event
setopt HIST_IGNORE_DUPS
# Save beginning and ending timestamps to the history file. The format of these timestamps is :<beginning time>:<ending time>:<command>.
setopt EXTENDED_HISTORY
# Shared history for all open shells
#setopt SHARE_HISTORY
# Remove the history (fc -l) command from the history when invoked.
setopt HIST_NO_STORE
# Remove superfluous blanks from each command line being added to the history list.
setopt HIST_REDUCE_BLANKS
# Putting a space before a command prevents it from being kept in the history
setopt HIST_IGNORE_SPACE

#######################################################################
### Options & Completion
#######################################################################
# Make cd push the old directory onto the directory stack.
setopt AUTO_PUSHD
# Don't push multiple copies of the same directory onto the directory stack.
setopt PUSHD_IGNORE_DUPS
# Treat the #, ~ and ^ characters as part of patterns for filename generation, etc. (An initial unquoted ~ always produces named directory expansion.
setopt EXTENDED_GLOB
# Exchanges the meanings of `+' and `-' when used with a number to specify a directory in the stack.
setopt PUSHD_MINUS
# Have pushd with no arguments act like `pushd $HOME'.
setopt PUSHD_TO_HOME

# Prevents aliases on the command line from being internally substituted before completion is attempted. The effect is to make the alias a distinct command for completion purposes.
setopt COMPLETE_ALIASES
# Automatically list choices on an ambiguous completion.
setopt AUTO_LIST
# Automatically use menu completion after the second consecutive request for completion, for example by pressing the tab key repeatedly. This option is overridden by MENU_COMPLETE.
setopt AUTO_MENU
#setopt MENU_COMPLETE
#setopt MULTIBYTE

autoload -Uz compinit
compinit

# Completion caching
zstyle ':completion::complete:*' use-cache on
zstyle ':completion::complete:*' cache-path .zcache
zstyle ':completion:*:cd:*' ignore-parents parent pwd

#Completion Options (Error fix)
#zstyle ':completion:*:match:*' original only
#zstyle ':completion::prefix-1:*' completer _complete
#zstyle ':completion:predict:*' completer _complete
#zstyle ':completion:incremental:*' completer _complete _correct
#zstyle ':completion:*' completer _complete _prefix _correct _prefix _match _approximate
#zstyle ':completion:*:approximate:*' max-errors 1 numeric

# Path Expansion
zstyle ':completion:*' special-dirs true
zstyle ':completion:*' expand true
zstyle ':completion:*' squeeze-shlashes true
zstyle ':completion::complete:*' '\\'
#zstyle ':completion:*:*:*:default' menu yes select #interactive
zstyle ':completion:*:*:default' force-list always

# require /etc/DIR_COLORS to display colors in the completion list
[ -f /etc/DIR_COLORS ] && eval $(dircolors -b /etc/DIR_COLORS)
export ZLSCOLORS="${LS_COLORS}"
zmodload zsh/complist
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' menu select=1

compdef pkill=kill
compdef pkill=killall
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:*:kill:*' menu yes select interactive
zstyle ':completion:*:kill:*'   force-list always
zstyle ':completion:*:processes' command 'ps -au$USER'

# Group matches and Describe
zstyle ':completion:*:matches' group true
zstyle ':completion:*:options' description true
zstyle ':completion:*:options' auto-description '%d'
zstyle ':completion:*:descriptions' format $'\e[01;33m -- %d --\e[0m'
zstyle ':completion:*:messages' format $'\e[01;35m -- %d --\e[0m'
zstyle ':completion:*:warnings' format $'\e[01;31m -- No Matches Found --\e[0m'

#######################################################################
### Key Binding
#######################################################################
#  Emacs Style: -e
#  VI Style: -v
#bindkey -e

bindkey '^f' history-incremental-search-backward

bindkey "\e[A" up-line-or-search                   # UpKey
#bindkey "\e[A" history-beginning-search-backward   # UpKey
bindkey "\eOA" up-line-or-search                   # UpKey   (New iterm binds up arrow to this, wtf, ^[[A is standard on all other xterm's)
#bindkey "\eOA" history-beginning-search-backward   # UpKey   (New iterm binds up arrow to this, wtf, ^[[A is standard on all other xterm's)
bindkey "\e[B" down-line-or-search                 # DownKey
#bindkey "\e[B" history-beginning-search-forward    # DownKey
bindkey "\eOB" down-line-or-search                 # DownKey (New iterm binds up arrow to this, wtf, ^[[A is standard on all other xterm's)
#bindkey "\eOB" history-beginning-search-forward    # DownKey (New iterm binds up arrow to this, wtf, ^[[A is standard on all other xterm's)

#bindkey '^[[5~' history-beginning-search-backward  # PageUp
#bindkey '^[[6~' history-beginning-search-forward   # PageDown
bindkey "\e[5~" beginning-of-history               # PageUp
bindkey "\e[6~" end-of-history                     # PageDown

bindkey '\e[1~' beginning-of-line                  # Home (console)
bindkey '\e[H'  beginning-of-line                  # Home (xterm)
bindkey '\eOH'  beginning-of-line                  # Home (gnome-terminal)
bindkey "\e[7~" beginning-of-line
bindkey "\e[H"  beginning-of-line

#bindkey '\e[2~' overwrite-mode                     # Insert (Linux console, xterm, gnome-terminal)
bindkey '\e[2~' quoted-insert                      # Insert (Linux console, xterm, gnome-terminal)
bindkey '\e[3~' delete-char                        # Delete (Linux console, xterm, gnome-terminal)

bindkey '\e[4~' end-of-line                        # End (Linux console)
bindkey '\e[F'  end-of-line                        # End (xterm)
bindkey '\eOF'  end-of-line                        # End (gnome-terminal)
bindkey "\e[8~" end-of-line

bindkey "\eOd"  backward-word
bindkey "\eOc"  forward-word

bindkey '^R' history-incremental-search-backward

# ubuntu demanded this once from iterm TERM=xterm-color
bindkey '^?' backward-delete-char

bindkey -M menuselect '^M' .accept-line

#bindkey "  " globalias
#bindkey " " magic-space


#######################################################################
### Others
#######################################################################
# Disable core dumps
limit coredumpsize 0

WORDCHARS='*?_-[]~=&;!#$%^(){}<>'

# ManPage Color Setting
export GROFF_NO_SGR=yes
export LESS_TERMCAP_mb=$'\E[01;31m'     # Begin blinking
export LESS_TERMCAP_md=$'\E[01;31m'     # Begin bold
export LESS_TERMCAP_me=$'\E[0m'         # End mode
export LESS_TERMCAP_se=$'\E[0m'         # End standout-mode - info box
export LESS_TERMCAP_so=$'\E[0;4;30;42m' # Begin standout-mode
export LESS_TERMCAP_ue=$'\E[0m'         # Begin underline
export LESS_TERMCAP_us=$'\E[01;32m'     # ENd underline

# Disable beep
test -x xset && xset -b

# disable GNU screen stop/start terminal problem (ctrl-s / ctrl-q)
stty -ixon

#######################################################################
### Functions
#######################################################################

# Fast add sudo command
sudo-command-line() {
    [[ -z $BUFFER ]] && zle up-history
    [[ $BUFFER != sudo\ * ]] && BUFFER="sudo $BUFFER"
    # move cursor to end of line
    zle end-of-line
}
zle -N sudo-command-line
# bindkey = <ESC> <ESC>
bindkey "\e\e" sudo-command-line

_rake_does_task_list_need_generating () {
  if [ ! -f .rake_tasks ]; then return 0;
  else
    accurate=$(stat -f%m .rake_tasks)
    changed=$(stat -f%m Rakefile)
    return $(expr $accurate '>=' $changed)
  fi
}

_rake () {
  if [ -f Rakefile ]; then
    if _rake_does_task_list_need_generating; then
      echo "\nGenerating .rake_tasks..." > /dev/stderr
      rake --silent --tasks | cut -d " " -f 2 > .rake_tasks
    fi
    compadd `cat .rake_tasks`
  fi
}

compdef _rake rake


calc() {
    awk "function factorial(n) {
             if (n<=1) return 1;
             return (n * factorial(n-1) );
         }
         BEGIN{ print $* }" ;
}

say() {
    mplayer -user-agent "Mozilla/5.0 (X11; U; Linux i686; en-US; rv:6.0a1) Gecko/20110524 Firefox/6.0a1" "http://translate.google.com/translate_tts?q=$1" > /dev/null 2>&1;
}

my_extip() {
    if [ -x `which wget` ]; then
        wget -O - -q icanhazip.com
    fi
}

m() {
    mkdir -p "$1" && cd "$1"
}

f() {
    sudo find "$(pwd)" -name "$1"
}

gmv() {
    mv "$1" "$2" && cd "$2"
}

pdfd() {
    impressive -t None --nologo -c persistent "$1"
}

g() {
    #_PS3=$PS3
    #__GOPATH=(
            #"data   : $HOME/data"
            #"project: $HOME/data/share/project"
            #"work   : $HOME/data/share/work"
            #"memo   : $HOME/data/memo"
            #"knowyourcode: $HOME/data/memo/_Law/_OpenSourceLicense/_book"
    #)
    #PS3='Please Choose one: '
    #select selection in ${__GOPATH[@]} ; do
        #if [ "$selection" ] ; then
            #_GOPATH=$(echo "$selection" | awk -F':' '{print $2}' | sed -e 's/^\ *//' -e 's/\ *$//')
            #break
        #else
            #echo 'invalid selection.'
        #fi
    #done
    #cd "$_GOPATH"
    #PS3=$_PS3

    __GOPATH=(
            "project     : $HOME/data/share/project"
            "work        : $HOME/data/share/work"
            "memo        : $HOME/data/memo"
            "knowyourcode: $HOME/data/memo/_Law/_OpenSourceLicense/_book"
            "android     : $HOME/data/share/project/dni/android"
            "adb         : $HOME/data/share/project/dni/android/adt-bundle-linux/sdk/platform-tools"
    )
    while do
        selection_count=0
        for selection in ${__GOPATH[@]} ; do
            let selection_count=selection_count+1
            echo "$selection_count) $selection"
        done
        echo ""
        echo -n 'Please Choose one: '
        read choice
        case $choice in
            [1-6])
                _GOPATH=$(echo "$__GOPATH[$choice]" | awk -F':' '{print $2}' | sed -e 's/^\ *//' -e 's/\ *$//')
                break
                ;;
            *)
                echo "invalid selection."
                echo ""
                ;;
        esac
    done
    cd "$_GOPATH"
}

initc() {
    \test -f $HOME/data/share/project/my/makefile/Makefile && \cp -f $HOME/data/share/project/my/makefile/Makefile .
    \test -f $HOME/data/share/project/my/makefile/main.c && \cp -f $HOME/data/share/project/my/makefile/main.c .
    \test -d $HOME/data/share/project/my/makefile/vendor && \cp -rpf $HOME/data/share/project/my/makefile/vendor .
    echo "Initial makefile project, done"
}

initj() {
    \test -f $HOME/data/share/project/my/_java/Makefile && \cp -f $HOME/data/share/project/my/_java/Makefile .
    echo "Initial makefile project, done"
}

initt() {
    \test -d $HOME/data/share/project/my/wowtalks && \cp -rpf $HOME/data/share/project/my/wowtalks .
    echo "Initial talks project, done"
}

# For command not found
command_not_found_handler() {
    python /usr/lib/command-not-found $1
    return 0
}

# ssh key manager (keychain)
loadkeys() {
    if [ -x `which keychain` ]; then
        for f in $HOME/.ssh/keys/* ; do
            if [[ $f != '.pub$' && -e "$f.pub" ]] ; then
                echo "Adding $f to keychain.."
                keychain -q $f
            fi
        done
        echo "Reload keychain env..."
        source $HOME/.keychain/*-sh
    else
        echo "ERROR: keychain not found, please install keychain first."
    fi
}

#######################################################################
### Command & Prompt
#######################################################################

function precmd {

    vcs_info

    local TERMWIDTH
    (( TERMWIDTH = ${COLUMNS} - 1 ))

    ###
    # Truncate the path if it's too long.

    PR_FILLBAR=""
    PR_PWDLEN=""

    local promptsize=${#${(%):---(%n@%m)----}}
    local pwdsize=${#${(%):-%~}}

    if [[ "$promptsize + $pwdsize" -gt $TERMWIDTH ]]; then
        ((PR_PWDLEN=$TERMWIDTH - $promptsize))
    else
        PR_FILLBAR="\${(l.(($TERMWIDTH - ($promptsize + $pwdsize)))..${PR_HBAR}.)}"
    fi

    ###
    # Get APM info.

    #if which ibam > /dev/null; then
        #PR_APM_RESULT=`ibam --percentbattery`
    #elif which apm > /dev/null; then
        #PR_APM_RESULT=`apm`
    #fi
}

preexec () {
    if [[ "$TERM" == "screen" ]]; then
    local CMD=${1[(wr)^(*=*|sudo|-*)]}
    echo -n "\ek$CMD\e\\"
    fi
}

setprompt () {
    ###
    # Need this so the prompt will work.

    setopt prompt_subst

    autoload -Uz vcs_info && vcs_info
    #- 1
    #zstyle ':vcs_info:*' formats '─%F{1}(%f%s%F{1})%f─%F{1}[%F{2}%b%F{1}]%f '
    #zstyle ':vcs_info:*' actionformats '%F{1}(%f%s%F{1})%f─%F{1}[%F{2}%b%F{3}|%F{1}%a%F{1}]%f'
    #zstyle ':vcs_info:(sv[nk]|bzr):' branchformat '%b%F{1}:%F{3}%r'
    #- 2
    #zstyle ':vcs_info:*' enable git cvs svn hg #bzr is slower than balls
    #zstyle ':vcs_info:*' disable-patterns "$HOME"
    #zstyle ':vcs_info:*' formats '%s %b'
    #zstyle ':vcs_info:git*:*' get-revision true
    #zstyle ':vcs_info:git*:*' formats '%8>>%i%>> %s %b'
    #zstyle ':vcs_info:git*:*' actionformats '%8>>%i%>> %B%F{red}%a%f%%b %b'
    #- 3
    #zstyle ':vcs_info:*' disable bzr cdv darcs mtn svk tla
    zstyle ':vcs_info:*' enable git cvs svn hg
    zstyle ':vcs_info:*' disable-patterns "$HOME"
    zstyle ':vcs_info:git*:*' get-revision true
    #zstyle ':vcs_info:(sv[nk]|bzr):' branchformat '%b%F{1}:%F{3}%r'
    zstyle ':vcs_info:(sv[nk]|bzr):' branchformat '%b%F{1}:%F{11}%r'
    zstyle ':vcs_info:*' formats '─%F{1}(%f%s%F{1})%f─%F{1}[%F{2}%b%F{1}]%f'
    zstyle ':vcs_info:git*:*' formats '─%F{1}(%f%s%F{1})%f─%F{1}[%F{2}%b%F{1}]%f─%8>>%i%>>'
    zstyle ':vcs_info:*' actionformats '─%F{1}(%f%s%F{1})%f─%F{1}[%F{2}%b%F{3}|%F{1}%a%F{1}]%f─%8>>%i%>>'
    zstyle ':vcs_info:git*:*' actionformats '─%F{1}(%f%s%F{1})%f─%F{1}[%F{2}%b%F{3}|%F{1}%a%F{1}]%f─%8>>%i%>> %B%F{red}%a%f%%b %b'

    ###
    # See if we can use colors.

    autoload colors zsh/terminfo
    if [[ "$terminfo[colors]" -ge 8 ]]; then
        colors
    fi
    for color in RED GREEN YELLOW BLUE MAGENTA CYAN WHITE; do
        eval PR_$color='%{$terminfo[bold]$fg[${(L)color}]%}'
        eval PR_LIGHT_$color='%{$fg[${(L)color}]%}'
        (( count = $count + 1 ))
    done
    PR_NO_COLOUR="%{$terminfo[sgr0]%}"

    ###
    # See if we can use extended characters to look nicer.

    typeset -A altchar
    set -A altchar ${(s..)terminfo[acsc]}
    PR_SET_CHARSET="%{$terminfo[enacs]%}"
    PR_SHIFT_IN="%{$terminfo[smacs]%}"
    PR_SHIFT_OUT="%{$terminfo[rmacs]%}"
    PR_HBAR=${altchar[q]:--}
    #PR_HBAR=" "
    PR_ULCORNER=${altchar[l]:--}
    PR_LLCORNER=${altchar[m]:--}
    PR_LRCORNER=${altchar[j]:--}
    PR_URCORNER=${altchar[k]:--}

    ###
    # Decide if we need to set titlebar text.

    case $TERM in
        xterm*)
            PR_TITLEBAR=$'%{\e]0;%(!.-=*[ROOT]*=- | .)%n@%m:%~ | ${COLUMNS}x${LINES} | %y\a%}'
            ;;
        screen)
            PR_TITLEBAR=$'%{\e_screen \005 (\005t) | %(!.-=[ROOT]=- | .)%n@%m:%~ | ${COLUMNS}x${LINES} | %y\e\\%}'
            ;;
        *)
            PR_TITLEBAR=''
            ;;
    esac

    ###
    # Decide whether to set a screen title
    if [[ "$TERM" == "screen" ]]; then
        PR_STITLE=$'%{\ekzsh\e\\%}'
    else
        PR_STITLE=''
    fi

    ###
    # Finally, the prompt.

#PROMPT='$PR_SET_CHARSET$PR_STITLE${(e)PR_TITLEBAR}\
#$PR_CYAN$PR_SHIFT_IN$PR_ULCORNER$PR_BLUE$PR_HBAR$PR_SHIFT_OUT [\
#$PR_GREEN%(!.%SROOT%s.%n)$PR_GREEN@%m\
#$PR_BLUE]$PR_BLUE($PR_YELLOW%D{%H:%M}$PR_BLUE) \
#$PR_MAGENTA%$PR_PWDLEN<..<%~%<<$PR_BLUE${vcs_info_msg_0_}\
#$PR_BLUE$PR_SHIFT_IN\

#$PR_CYAN$PR_SHIFT_IN$PR_LLCORNER$PR_BLUE$PR_HBAR$PR_SHIFT_OUT \
#$PR_LIGHT_BLUE%(!.$PR_RED#.$PR_WHITE\$)$PR_SHIFT_IN$PR_SHIFT_OUT\
#$PR_CYAN$PR_SHIFT_IN$PR_SHIFT_OUT\
#$PR_NO_COLOUR '

PROMPT='$PR_SET_CHARSET$PR_STITLE${(e)PR_TITLEBAR}\
$PR_BLUE [\
$PR_GREEN%(!.%SROOT%s.%n)$PR_GREEN@%m\
$PR_BLUE]$PR_BLUE($PR_YELLOW%D{%H:%M}$PR_BLUE) \
$PR_MAGENTA%$PR_PWDLEN<..<%~%<<$PR_BLUE${vcs_info_msg_0_}\
$PR_BLUE$PR_SHIFT_IN\

$PR_BLUE$PR_SHIFT_OUT\
$PR_LIGHT_BLUE%(!.$PR_RED#.$PR_WHITE\$)$PR_SHIFT_IN$PR_SHIFT_OUT\
$PR_CYAN$PR_SHIFT_IN$PR_SHIFT_OUT\
$PR_NO_COLOUR '

RPROMPT=''

PS2='$PR_CYAN$PR_SHIFT_IN$PR_HBAR$PR_SHIFT_OUT\
$PR_BLUE$PR_SHIFT_IN$PR_HBAR$PR_SHIFT_OUT(\
$PR_LIGHT_GREEN%_$PR_BLUE)$PR_SHIFT_IN$PR_HBAR$PR_SHIFT_OUT\
$PR_CYAN$PR_SHIFT_IN$PR_HBAR$PR_SHIFT_OUT$PR_NO_COLOUR '
}

setprompt

[[ -s $HOME/.pythonbrew/etc/bashrc ]] && source $HOME/.pythonbrew/etc/bashrc
[[ -s $HOME/javabrew/etc/bashrc ]] && source $HOME/javabrew/etc/bashrc
[[ -s $HOME/.phpbrew/bashrc ]] && export PHPBREW_SET_PROMPT=1 && source $HOME/.phpbrew/bashrc
[[ -s $HOME/.cabal/bin ]] && export PATH=$HOME/.cabal/bin:$PATH


export PTOOLSPATH=/home/ant/bin/phalcon-devtools/
export PATH=$PATH:/home/ant/bin/phalcon-devtools
