#!/bin/bash
# from http://www.anishathalye.com/2014/08/03/managing-your-dotfiles/

BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# vim
ln -s ${BASEDIR}/vimrc ~/.vimrc

# bug next line is not idempotent: directory vim contains directory vim ...
ln -s ${BASEDIR}/vim/ ~/.vim

# vim spell files (big files not under version control)
wget http://ftp.vim.org/vim/runtime/spell/fr.utf-8.spl
wget http://ftp.vim.org/vim/runtime/spell/fr.utf-8.sug
mv fr.utf-8.spl vim/spell/
mv fr.utf-8.sug vim/spell/

# bash
ln -s ${BASEDIR}/bash_aliases ~/.bash_aliases
ln -s ${BASEDIR}/bash_profile ~/.bash_profile
ln -s ${BASEDIR}/bashrc ~/.bashrc
ln -s ${BASEDIR}/dir_colors ~/.dir_colors
ln -s ${BASEDIR}/inputrc ~/.inputrc

# tmux
ln -s ${BASEDIR}/tmux.conf ~/.tmux.conf

# git
ln -s ${BASEDIR}/gitconfig ~/.gitconfig

# hg
ln -s ${BASEDIR}/hgrc ~/.hgrc

# tikz2pdf
ln -s ${BASEDIR}/tikz2pdf.tex ~/.tikz2pdf.tex

# Done
echo "Done installing dotfiles (unless they some were already there!)"
echo "... you should now check whether some config files are missing."
