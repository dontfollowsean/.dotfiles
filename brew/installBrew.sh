#!/bin/bash

packages='packages.txt'
casks='casks.txt'

if ! [ -x "$(command -v brew)" ]; then
  echo 'homebrew is not installed.' >&2
  echo 'Installing homebrew'
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  brew doctor
fi

while read pkg; do
brew install $pkg
done < $packages

while read cask; do
brew cask install $cask
done < $casks
 