#!/bin/bash
# from http://www.anishathalye.com/2014/08/03/managing-your-dotfiles/

BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"


# dot files
FILES="bash_aliases bash_profile bashrc dircolors gitconfig hgrc inputrc tikz2pdf.tex tmux.conf vim/ vimrc"
for FILE in $FILES
do
    if [ -f ~/.$FILE ] || [ -d ~/.$FILE ]; then
        echo "File or directory ~/.$FILE exists: we do nothing."
    else
        echo "Creation of symbolic link for $FILE"
        ln -s ${BASEDIR}/$FILE ~/.$FILE
    fi
done

# Ipython config
DEST=`sage -ipython locate`/profile_default
FILES="ipython_config.py ipython_kernel_config.py"
for FILE in $FILES
do
    if [ -f $DEST/$FILE ] ; then
        echo "File $DEST/$FILE exists: we do nothing."
    else
        echo "Creation of symbolic link for $FILE"
        ln -s ${BASEDIR}/$FILE $DEST/$FILE
    fi
done

# os dependant wget vs curl
unamestr=`uname`
if [[ "$unamestr" == 'Linux' ]]; then
   WGET=wget
elif [[ "$unamestr" == 'Darwin' ]]; then
   WGET="curl -O"
fi

# Download vim spell files (big files not under version control)
DEST=vim/spell
FILES="fr.utf-8.spl fr.utf-8.sug"
for FILE in $FILES
do
    if [ -f $DEST/$FILE ] ; then
        echo "File $DEST/$FILE exists: we do nothing."
    else
        $WGET http://ftp.vim.org/vim/runtime/spell/$FILE
        mv $FILE $DEST
    fi
done

# Done
echo "Done installing dotfiles (unless they were already there!)"
echo "... you should now check whether some config files are missing."
