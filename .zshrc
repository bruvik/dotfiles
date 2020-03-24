# fix locale issues with python
export LC_ALL=no_NO.UTF-8
export LANG=no_NO.UTF-8

# use vim as editor
export EDITOR="code --wait --new-window"

# emacs keybindings
bindkey -e

setopt autocd
setopt nocaseglob
setopt CORRECT
setopt CORRECT_ALL
SPROMPT="Correct %F{red}%R%f to %F{green}%r%f [nyae]?"
VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python3 
source /usr/local/bin/virtualenvwrapper.sh

# set path:
path=/bin:/usr/bin/:/local/bin
for dir in 	/usr/local/bin \
    /bin /local/bin /usr/bin /site/bin \
   /sbin /usr/sbin \
   /local/bin /local/gnu/bin \
   /local/sbin /usr/bin/X11 \
   /usr/local/munki \
   /usr/local/sbin \
   /opt/local/bin \
   $HOME/bin; do
test -d $dir && path+=$dir
done
typeset -U path
export PATH

# history
HISTFILE=${ZDOTDIR:-$HOME}/.zsh_history
HISTSIZE=20000
SAVEHIST=100000
setopt EXTENDED_HISTORY
setopt SHARE_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_FIND_NO_DUPS
setopt HIST_REDUCE_BLANKS
setopt HIST_IGNORE_SPACE

# aliases
alias os='openstack'

source ${HOME}/.aliases
source ${HOME}/.extra
# source ${HOME}/.exports
# 
# [[ -e ${HOME}/.bash_profile ]] && emulate sh -c 'source ${HOME}/.bash_profile'

# gpg-agent
# USE GPG as ssh-agent
export GPG_TTY="$(tty)"
export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
gpgconf --launch gpg-agent

#prompt
PROMPT='%(?.%F{green}√.%F{red}?%?)%f %B%F{240}%1~%f%b %# '

# right prompt - git status
autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
RPROMPT=\$vcs_info_msg_0_
zstyle ':vcs_info:git:*' formats '%F{240}(%b)%r%f'
zstyle ':vcs_info:*' enable git

# The following lines were added by compinstall

zstyle ':completion:*' completer _complete _ignored _approximate
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' matcher-list '' 'm:{[:lower:]}={[:upper:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'r:|[._-]=* r:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle :compinstall filename '/Users/anders/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall