# Load ~/.extra, ~/.bash_prompt, ~/.exports, ~/.aliases and ~/.functions
# ~/.extra can be used for settings you don’t want to commit
os=`uname -s`
hostname=`hostname | cut -d. -f1`


# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.{path,bash_prompt,exports,aliases,functions,extra}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

# Case-insensitive globbing (used in pathname expansion)
# shopt -s nocaseglob;

# Append to the Bash history file, rather than overwriting it
# shopt -s histappend;

# Autocorrect typos in path names when using `cd`
# shopt -s cdspell;

# Enable some Bash 4 features when possible:
# * `autocd`, e.g. `**/qux` will enter `./foo/bar/baz/qux`
# * Recursive globbing, e.g. `echo **/*.txt`
for option in autocd globstar; do
	shopt -s "$option" 2> /dev/null;
done;

# Add tab completion for many Bash commands
if which brew &> /dev/null && [ -f "$(brew --prefix)/share/bash-completion/bash_completion" ]; then
	source "$(brew --prefix)/share/bash-completion/bash_completion";
elif [ -f /etc/bash_completion ]; then
	source /etc/bash_completion;
fi;

# Enable tab completion for `g` by marking it as an alias for `git`
# if type _git &> /dev/null && [ -f /usr/local/etc/bash_completion.d/git-completion.bash ]; then
# 	complete -o default -o nospace -F _git g;
# fi;

# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
# [ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2- | tr ' ' '\n')" scp sftp ssh;

# Add tab completion for `defaults read|write NSGlobalDomain`
# You could just use `-g` instead, but I like being explicit
# complete -W "NSGlobalDomain" defaults

# Add `killall` tab completion for common apps
# complete -o "nospace" -W "Finder Dock Mail Safari iTunes iCal Address\ Book SystemUIServer" killall

# set up path
# PATH=/bin:/usr/bin/:/local/bin
# for dir in $HOME/bin \
# 	/usr/local/bin \
#   /bin /local/bin /usr/bin /site/bin \
#   /sbin /usr/sbin \
#   /local/bin /local/gnu/bin \
#   /local/sbin /usr/bin/X11 \
#   /usr/local/munki \
#   /usr/local/sbin \
#   /opt/local/bin; do
# test -d $dir && path=$path:$dir
# done
# 
# npath=`echo $path | sed 's/^://'`
# declare -x PATH=$npath
# unset path npath
# export PATH=$PATH

# use vim as standard editor on darwin
EDITOR="vim"
export EDITOR=$EDITOR

# To use Homebrew's directories rather than ~/.rbenv add to your profile:
#  export RBENV_ROOT=/usr/local/var/rbenv

# To enable shims and autocompletion add to your profile:
#if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
# complete -W "NSGlobalDomain" defaults;

# Add `killall` tab completion for common apps
# complete -o "nospace" -W "Contacts Calendar Dock Finder Mail Safari iTunes SystemUIServer Terminal Twitter" killall;

# iterm integration
test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

# virtualenv
VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python3 source /usr/local/bin/virtualenvwrapper.sh

# gpg-agent
# USE GPG as ssh-agent
export GPG_TTY="$(tty)"
export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
gpgconf --launch gpg-agent