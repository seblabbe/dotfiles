#!/bin/bash
# from http://www.anishathalye.com/2014/08/03/managing-your-dotfiles/

BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# bash
ln -s ${BASEDIR}/bash_aliases ~/.bash_aliases
ln -s ${BASEDIR}/bash_profile ~/.bash_profile
ln -s ${BASEDIR}/bashrc ~/.bashrc
ln -s ${BASEDIR}/dir_colors ~/.dir_colors
ln -s ${BASEDIR}/inputrc ~/.inputrc

# vim
ln -s ${BASEDIR}/vimrc ~/.vimrc
ln -s ${BASEDIR}/vim/ ~/.vim

# tmux
ln -s ${BASEDIR}/tmux.conf ~/.tmux.conf

# git
ln -s ${BASEDIR}/gitconfig ~/.gitconfig

# hg
hgrc

# tikz2pdf
tikz2pdf.tex

# vim spell files (big files not under version control)
wget http://ftp.vim.org/vim/runtime/spell/fr.utf-8.spl
wget http://ftp.vim.org/vim/runtime/spell/fr.utf-8.sug
mv fr.utf-8.spl vim/spell/
mv fr.utf-8.sug vim/spell/

# Done
echo "Done installing dotfiles"
