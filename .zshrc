# history
HISTFILE="$HOME/.zsh_history"
HISTSIZE=100000
SAVEHIST=100000

setopt append_history          # Append new history to HISTFILE instead of overwriting it.
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
unsetopt beep                  # Disable terminal beeps from zsh.

# completion styling
zstyle ':completion:*' menu no
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' group-name ''
zstyle ':completion:*:descriptions' format '[%d]'
zstyle ':completion:*' verbose yes
zstyle ':completion:*' use-cache on

# fzf-tab styling
zstyle ':fzf-tab:*' switch-group '<' '>'
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

# autosuggestions
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20

# load plugins
source /opt/homebrew/opt/antidote/share/antidote/antidote.zsh
antidote load

# directory jumping
if command -v zoxide >/dev/null 2>&1; then
  eval "$(zoxide init zsh)"
fi

# searchable shell history
if command -v atuin >/dev/null 2>&1; then
  eval "$(atuin init zsh --disable-up-arrow)"
fi

# prompt
if command -v starship >/dev/null 2>&1; then
  eval "$(starship init zsh)"
fi
