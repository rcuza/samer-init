# The following lines were added by compinstall

zstyle ':completion:*' completer _expand _complete _ignored _correct _approximate
zstyle ':completion:*' max-errors 1
zstyle :compinstall filename '/home/satiani/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

#History file options
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

#zsh options
setopt appendhistory            # multiple sessions share history
setopt autocd                   # if command isn't executable, try to cd to directory
setopt extendedglob             # more filename generation features
setopt auto_pushd               # automatically push old directory to stack
setopt pushd_ignore_dups        # ignore dups when doing pushd
setopt no_list_beep             # no beep on ambiguous completions
setopt extended_history         # save timestamp and duration in command history
setopt no_hist_beep             # no beep on history
setopt hist_ignore_all_dups     # ignore dups in history
setopt hist_ignore_space        # when commands are prepended by space, don't save them to disk
setopt hist_reduce_blanks       # remove superfluous blanks before saving in history
setopt print_exit_value         # print exit value on non-zero exits
setopt no_beep                  # no beeps
setopt auto_resume              # single word commands are candidates for job resumption

autoload edit-command-line
zle -N edit-command-line

bindkey -v
bindkey -M vicmd 'v' edit-command-line
bindkey '^R' history-incremental-search-backward
bindkey 'OA' up-line-or-history #application mode binding
bindkey '[A' up-line-or-history
bindkey '[1~' beginning-of-line
bindkey 'OH' beginning-of-line
bindkey '[4~' end-of-line
bindkey 'OF' end-of-line
bindkey '' backward-delete-char
bindkey '[3~' delete-char
bindkey '' run-help

PROMPT='%d$ '                   # default prompt
RPROMPT='[%n@%M>%l]'            # prompt for right side of screen
export EDITOR=vim

alias ls='ls --color=auto'
alias views='cd ~/code/views_workspace/views'
alias km='cd ~/code/km_workspace/km'
alias grep='grep --color=auto'
alias sqlplus='rlwrap sqlplus'
alias lampstart='sudo /opt/lampp/lampp start'
alias lampstop='sudo /opt/lampp/lampp stop'
alias lamprestart='lampstop && lampstart'
alias svn-1.5='/home/satiani/svn-1.5/bin/svn'
alias tmux='tmux -2'
alias assmt-web-app='cd /home/satiani/code/assmt-web-app/ && source ../assmt-web-app-venv/bin/activate'

#ack-grep and vim don't work perfectly within tmux 
#changing the TERM fixes their problems
if [ ! -z "$TMUX" ]; then
    alias ack-grep='TERM=vt100 ack-grep' 
    alias vi='TERM=xterm-256color vi'
    alias vim='TERM=xterm-256color vim'
fi

export ORACLE_HOME=/opt/wgoracle-client/u01/app/oracle/product/10.2.0.3.0
export JAVA_HOME=/usr/lib/jvm/java-6-sun
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$ORACLE_HOME/lib
export LAMPP_HOME=/opt/lampp
export PATH=$JAVA_HOME/bin:$HOME/bin:$PATH:$ORACLE_HOME/bin:/usr/sbin:$LAMPP_HOME/bin
export EDITOR=vim
export LC_ALL=C
