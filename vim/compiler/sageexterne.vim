" Vim compiler file
" Compiler:	Sage doctest testing (for external sage file)
" Maintainer: Franco Saliola <saliola@gmail.com>
" Last Change: 2009 August 25
" Last Change: 2011 January 14 (Sebastien Labbe)
"
" Installation: Copy this file to
" 
"     ~/.vim/compiler/sage.vim
" 
" Usage:
"
" Start vim and set the compiler using the following command:
" 
"     :compiler sage
" 
" To run the doctests on the current file, use the make command:
" 
"     :make
"
" To run the doctests on all the files in the current directory:
"
"     :make *
"
" If there are errors, then a quickfix window will open.
" To move to the next error, use the next command :cn;
" to move to the previous error, use the previous command :cp.

CompilerSet makeprg=sage\ \-t\ %
CompilerSet errorformat=File\ \"%f\"\\,\ line\ %l:%.%#
autocmd QuickFixCmdPost make :cwindow
