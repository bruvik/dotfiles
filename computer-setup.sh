#!/bin/bash

# setting up a new machine:

#install homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

#install some software
brew install homebrew/cask-fonts/font-inconsolata
brew install gpg
brew install tmux
brew cask install visual-studio-code 
brew install pass
brew cask install tunnelblick
brew install pinentry-mac
brew install dnsmasq
brew install mtr

#install from mac app store:
# slack, tweetbot, 1blocker, tyme, onedrive, kindle

# git repo for team-pass (needs to fix ssh first)
git clone git@github.com:safespring/pass.git

# set up dnsmasq - fix local dns settings manually:
echo 'server=/cloud.ipnett.se/10.11.20.22' >> /usr/local/etc/dnsmasq.d/10-safespring
echo 'server=/cloud.ipnett.no/10.11.20.22' > /usr/local/etc/dnsmasq.d/10-safespring
sudo brew services start dnsmasq

# virtualenv 
export PIP_REQUIRE_VIRTUALENV=false
pip3 install virtualenv
pip3 install virtualenvwrapper
export PIP_REQUIRE_VIRTUALENV=true