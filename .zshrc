# history
HISTFILE="$HOME/.zsh_history"
HISTSIZE=100000
SAVEHIST=100000

setopt extended_history        # Save timestamps and command durations in history entries.
setopt inc_append_history_time  # Write commands to history after they finish, including runtime.
unsetopt share_history         # Do not continuously import/export history across open shells.

setopt hist_ignore_dups        # Do not save a command if it duplicates the immediately previous one.
setopt hist_ignore_space       # Do not save commands that start with a leading space.
setopt hist_reduce_blanks      # Collapse extra whitespace before saving commands to history.
setopt hist_find_no_dups       # When searching history, skip duplicate matches already shown.
setopt hist_save_no_dups       # When writing HISTFILE, remove older duplicates.
setopt hist_verify             # Show history expansion results for review instead of running immediately.
setopt hist_fcntl_lock         # Use safer file locking when multiple shells write history.

# shell behavior
setopt auto_cd                 # Let you type a directory path by itself to cd into it.
setopt auto_pushd              # Make cd push the previous directory onto the directory stack.
setopt pushd_ignore_dups       # Avoid duplicate entries in the directory stack.
setopt pushd_silent            # Do not print the directory stack after pushd/popd/cd stack changes.
setopt complete_in_word        # Allow completion from the cursor position inside a word.
setopt always_to_end           # Move cursor to the end of the completed word after completion.
setopt interactive_comments    # allows # comments in interactive shell (useful for documenting history entries)
unsetopt beep                  # Disable terminal beeps from zsh.

# completion styling
zstyle ':completion:*' menu no
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' group-name ''
zstyle ':completion:*:descriptions' format '[%d]'
zstyle ':completion:*' verbose yes
zstyle ':completion:*' use-cache on

# fzf-tab styling
if (( $+commands[vivid] )); then
  export LS_COLORS="$(vivid generate catppuccin-mocha)"
fi

zstyle ':fzf-tab:*' use-fzf-default-opts yes
zstyle ':fzf-tab:*' switch-group '<' '>'
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -1 --color=always "$realpath" 2>/dev/null || ls -1 "$realpath"'
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

# fzf styling
export FZF_DEFAULT_OPTS=" \
  --color=bg+:#313244,bg:#1E1E2E,spinner:#F5E0DC,hl:#F38BA8 \
  --color=fg:#CDD6F4,header:#F38BA8,info:#CBA6F7,pointer:#F5E0DC \
  --color=marker:#B4BEFE,fg+:#CDD6F4,prompt:#CBA6F7,hl+:#F38BA8 \
  --color=selected-bg:#45475A \
  --color=border:#6C7086,label:#CDD6F4"

# autosuggestions
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20

if (( $+commands[eza] )); then
  alias ls='eza --icons=auto --group-directories-first'
  alias ll='eza --long --header --git --icons=auto --group-directories-first'
  alias la='eza --all --icons=auto --group-directories-first'
  alias lla='eza --long --all --header --git --icons=auto --group-directories-first'
  alias lt='eza --tree --level=2 --icons=auto --group-directories-first'
fi

# bat: cat replacement, but preserve cat-like no-pager behavior
if (( $+commands[bat] )); then
  alias cat='bat --paging=never'
  alias catn='bat --style=numbers --paging=never'
  alias catp='bat --style=auto'
fi

# load plugins
source /opt/homebrew/opt/antidote/share/antidote/antidote.zsh
antidote load

# directory jumping
if (( $+commands[zoxide] )); then
  eval "$(zoxide init zsh)"
fi

# searchable shell history
if (( $+commands[atuin] )); then
  eval "$(atuin init zsh --disable-up-arrow)"
fi

# prompt
if (( $+commands[starship] )); then
  eval "$(starship init zsh)"
fi

bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
