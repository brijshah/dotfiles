#!/bin/bash

TF_VERSION=0.12.1
TF_ZIP=terraform_"$TF_VERSION"_darwin_amd64.zip

# Check for xcode-command-line tools, otherwise exit
if type xcode-select >&- && xpath=$( xcode-select --print-path ) &&
   test -d "${xpath}" && test -x "${xpath}" ; then
   printf "xcode command line tools already installed.\n"
else
   printf "xcode command line tools not installed. Please install this first.\n"
   exit 1
fi

# Check for Homebrew, install if it is not present
if test ! $(which brew); then
    printf "Installing homebrew...\n"
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" </dev/null
fi

brew install antibody
brew install git
brew install python3
brew install terraform-docs
brew install terminal-notifier
brew install tree
brew install wget
brew install zsh
brew install jq
brew install ruby
brew install terraform_landscape
brew install yarn

grep -q -f $(which zsh) /etc/shells || echo $(which zsh) | sudo tee -a /etc/shells
chsh -s $(which zsh)

# awscli
pip3 install --user awscli

# kubectl
curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/darwin/amd64/kubectl
chmod +x ./kubectl
sudo mv ./kubectl /usr/local/bin/kubectl

# terraform
curl -LO https://releases.hashicorp.com/terraform/"$TF_VERSION"/"$TF_ZIP"
unzip $TF_ZIP
mv terraform /usr/local/bin/
rm $TF_ZIP
