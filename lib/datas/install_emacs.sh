#!/bin/bash

echo 'emacs_install start 1-step'
cd ~

echo '1-step: install homebrew?[Y/n]'
read ANSWER
case $ANSWER in
    "" | "Y" | "y" )
	ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)";;
    * ) echo "install homebrew skip";;
esac

echo '2-step: update emacs?[Y/n]'
read ANSWER
case $ANSWER in
    "" | "Y" | "y" )
	brew tap railwaycat/emacsmacport
	brew install emacs-mac --with-modern-icon;;
    * ) echo "update emacs skip";;
esac

echo 'emacs_install finish!!'
