#!/usr/bin/zsh

HISTFILE=~/.histfile
HISTSIZE=2000
SAVEHIST=2000
setopt autocd nomatch notify
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/ron/.zshrc'

autoload -Uz compinit promptinit
compinit
promptinit

#==== source
. $HOME/.aliases
. $HOME/.cat-mocha-tty
. $HOME/.zsh/catppuccin_mocha-zsh-syntax-highlighting.zsh
. $HOME/.zprofile
. $HOME/.zshenv
. /usr/share/zsh/site-functions/zsh-history-substring-search.zsh
#. /usr/share/zsh/site-functions/zsh-autosuggestions.zsh
. ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
. /usr/share/zsh/site-functions/zsh-syntax-highlighting.zsh

#==== kitty shell integration
export KITTY_SHELL_INTEGRATION="enabled"
autoload -Uz -- /home/ron/.config/kitty/kitty-integration; kitty-integration; unfunction kitty-integration

#==== other
# Base16 Shell
BASE16_SHELL="$HOME/.config/base16-shell/"
[ -n "$PS1" ] && \
    [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
        eval "$("$BASE16_SHELL/profile_helper.sh")"

# Define a function to search for packages in Gentoo repository if a command is not found.
command_not_found_handler() {
    local cmd="$1"
    echo "The command '$cmd' is not found on your system."

    # Search for packages in the Gentoo repository
    echo "Searching for possible packages in the repository..."
    emerge -s "$cmd"

    # Check if any packages were found
    if [[ $? -eq 0 ]]; then
        echo "You can install the program using 'emerge <package_name>'."
    else
        echo "No packages found in the repository. You may need to add a custom overlay or find an alternative source."
    fi
}

#==== Settings for umask
if (( EUID == 0 )); then
    umask 002
else
    umask 022
fi

#==== dir colors
LS_COLORS='rs=0:di=01;34:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:su=37;41:sg=30;43:tw=30;42:ow=34;42:st=37;44:ex=01;32:';
export LS_COLORS

#=== Color man pages
export LESS_TERMCAP_mb=$'\E[01;32m'
export LESS_TERMCAP_md=$'\E[01;32m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;47;34m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;36m'
# mandatory for colored man pages
export GROFF_NO_SGR=1         # For Konsole and Gnome-terminal

#==== prompts

[[ $COLORTERM = *(24bit|truecolor)* ]] || zmodload zsh/nearcolor

autoload -U colors zsh/terminfo
colors

autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git hg
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:git*' formats "%{${fg[cyan]}%}[%{${fg[green]}%}%s%{${fg[cyan]}%}][%{${fg[blue]}%}%r/%S%%{${fg[cyan]}%}][%{${fg[blue]}%}%b%{${fg[yellow]}%}%m%u%c%{${fg[cyan]}%}]%{$reset_color%}"

setprompt() {
  setopt prompt_subst

  if [[ -n "$SSH_CLIENT"  ||  -n "$SSH2_CLIENT" ]]; then 
    p_host='%F{yellow}%M%f'
  else
    p_host='%F{green}%M%f'
  fi

  PS1=${(j::Q)${(Z:Cn:):-$'
    %F{blue}[%f
    %(!.%F{red}%n%f.%F{green}%n%f)
    %F{blue}@%f
    ${p_host}
    %F{blue}][%f
    %F{yellow}%~%f
    %F{blue}]%f
    %(!.%F{red}%#%f.%F{green}%#%f)
    " "
  '}}

  PS2=$'%_>'
  RPROMPT=$'${vcs_info_msg_0_}'
}
setprompt