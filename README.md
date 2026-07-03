# dotfiles

Personal macOS configuration files for zsh, git, vim, and the terminal.

## What's here

| File | Purpose |
| --- | --- |
| `.zshenv` | XDG base directories, `EDITOR`, locale |
| `.zprofile` | Homebrew shellenv and `PATH` setup |
| `.zshrc` | History, shell options, completion, aliases, tool integration |
| `.zsh_plugins.txt` | Plugin list for [antidote](https://github.com/mattmc3/antidote) (fzf-tab, autosuggestions, syntax highlighting, etc.) |
| `starship.toml` | [Starship](https://starship.rs) prompt config |
| `.spaceshiprc.zsh` | [Spaceship](https://spaceship-prompt.sh) prompt config (alternative prompt) |
| `config.ghostty` | [Ghostty](https://ghostty.org) terminal config (Catppuccin Frappé) |
| `.vimrc` | Vim settings |
| `git/config` | Git settings and aliases |
| `git/ignore` | Global gitignore |
| `Brewfile` | Homebrew packages, casks, fonts, and VS Code extensions |

## Highlights

- **Modern CLI replacements** — `eza` for `ls`, `bat` for `cat`, `fd` for `find`, `ripgrep` for `grep`, aliased when installed
- **fzf everywhere** — fuzzy tab completion via fzf-tab, themed with Catppuccin Mocha
- **Shell history** — [atuin](https://atuin.sh) plus tuned zsh history options (100k entries, dedupe, timestamps)
- **Git defaults** — rebase on pull, auto-setup remote on push, histogram diffs, `diff3` conflict style

## Touch ID for Sudo
```
cd /etc/pam.d
sudo cp sudo_local.template sudo_local
sudo vim sudo_local
```
In that file, navigate to the line that contains with pam_tid.so and delete the hashtag (#) at the beginning.
