#!/bin/bash
# brew_install_meld.sh

# {{ansible_managed}}

brew uninstall cairo gtk+ pygobject py2cairo pygtk
brew install python
brew tap phinze/homebrew-cask
brew cask install Caskroom/cask/xquartz
brew install cairo gtk+
brew install py2cairo pygtk
brew install pygobject
brew install meld