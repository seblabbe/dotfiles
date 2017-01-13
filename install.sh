#!/bin/bash
# from http://www.anishathalye.com/2014/08/03/managing-your-dotfiles/

BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# vim
ln -s ${BASEDIR}/vimrc ~/.vimrc
ln -s ${BASEDIR}/vim/ ~/.vim

# zsh
ln -s ${BASEDIR}/zshrc ~/.zshrc

# git
ln -s ${BASEDIR}/gitconfig ~/.gitconfig

# spell (big files not under version control)
wget http://ftp.vim.org/vim/runtime/spell/fr.utf-8.spl
wget http://ftp.vim.org/vim/runtime/spell/fr.utf-8.sug
mv fr.utf-8.spl vim/spell/
mv fr.utf-8.sug vim/spell/
