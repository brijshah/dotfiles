# History
HISTFILE="$HOME/.zsh_history"
HISTSIZE=50000
SAVEHIST=50000

setopt append_history
setopt inc_append_history
setopt extended_history
setopt hist_ignore_dups
setopt hist_ignore_space
setopt hist_reduce_blanks
setopt share_history

# Completion
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

autoload -Uz compinit
compinit

if command -v starship >/dev/null 2>&1; then
  eval "$(starship init zsh)"
fi

source /opt/homebrew/opt/antidote/share/antidote/antidote.zsh
antidote load
