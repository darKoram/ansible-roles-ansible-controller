#!/bin/bash
# brew_install_meld.sh

brew uninstall cairo gtk+ pygobject py2cairo pygtk
brew tap phinze/homebrew-cask
brew install cairo gtk+
brew install py2cairo pygtk
brew install pygobject
brew install meld