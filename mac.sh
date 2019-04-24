## Install Homebrew
'ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" < /dev/null'

## Install vim plugged
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

## Install cask
brew tap caskroom/cask

## Install better packages packages
brew install coreutils
brew install findutils

## Install programming languages
brew install python3
brew install node
brew install go

## Install general dev stuff
brew install zsh
brew install neovim
brew install git
brew cask install sublime
brew cask install alacritty

## Install other apps
brew cask install vivaldi
brew cask install keybase
brew cask install slack
brew cask install spotify

chsh -s /bin/zsh
