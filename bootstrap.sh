#!/bin/bash

# Check for xcode-command-line tools, otherwise exit
if type xcode-select >&- && xpath=$( xcode-select --print-path ) &&
   test -d "${xpath}" && test -x "${xpath}" ; then
   printf "xcode command line tools already installed.\n"
else
   printf "xcode command line tools not installed. Please install this first.\n"
   exit 1
fi

# Check for Homebrew, install if we don't have it
if test ! $(which brew); then
    printf "Installing homebrew...\n"
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

brew install antibody
brew install zsh
brew install terminal-notifier
brew install python3
brew install wget
brew install git

grep -q -f $(which zsh) /etc/shells || echo $(which zsh) | sudo tee -a /etc/shells
chsh -s $(which zsh)

wget -O "/Users/$USER/Downloads/pock.zip" "https://pock.dev/download.php?file=pock_0_5_1_lack.zip"