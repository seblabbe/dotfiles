
" An example for a vimrc file.
"
" Maintainer:    Bram Moolenaar <Bram@vim.org>
" Last change:    2006 Nov 16
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"          for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"        for OpenVMS:  sys$login:.vimrc

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" utiliser ceci peut-etre...
" http://piao-tech.blogspot.com/2010/11/2010-vim-configuration.html

" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" pour avoir des no de ligne relatifs
"set nu
"set relativenumber

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

if has("vms")
  set nobackup        " do not keep a backup file, use versions instead
else
  set backup           " keep a backup file
  set backupdir=~/tmp  " where to put backup files
  set directory=~/tmp  " directory to place swap files in
endif
set history=50        " keep 50 lines of command line history
set ruler             " show the cursor position all the time
set showcmd           " display incomplete commands
set incsearch         " do incremental searching

if $VIM_CRONTAB == "true"
set nobackup
set nowritebackup
endif

""""""
" Changer de repertoire automatiquement
" autocmd BufEnter * lcd %:p:h

""""""
"color scheme
colorscheme torte
"colorscheme morning
"colorscheme github

""""""
" dark background 
" (doit etre apres colorscheme)
" (ne fonctionne pas si on ne le met pas a light dabord)
" set background=light
set background=dark

""""""
"Tabulations settings
set expandtab   " Make sure that every file uses space not tabs
set shiftround  " Round indent to multiple of 'shiftwidth'
set autoindent  " Copy indent from current line, over to the new line
set tabstop=4
set shiftwidth=4

" Enable file type detection.
" Use the default filetype settings, so that mail gets 'tw' set to 72,
" 'cindent' is on in C files, etc.
" Also load indent files, to automatically do language-dependent indenting.
filetype plugin indent on

""""""
" Filetype detection
autocmd BufRead,BufNewFile *.sage set filetype=python
" autocmd BufRead,BufNewFile *.pyx,*.spyx set filetype=cython
autocmd BufRead,BufNewFile *.pyx,*.spyx,*.pxi set filetype=python
autocmd BufRead,BufNewFile *.rst,*.txt set filetype=rst
autocmd BufRead,BufNewFile *.tikz set filetype=tex
autocmd BufRead,BufNewFile *.tex set filetype=tex
autocmd BufRead,BufNewFile *.sage compiler sageexterne

""""""
" Python/Sage settings
"autocmd FileType python set makeprg=sage\ -b\ &&\ sage\ -t\ %
autocmd FileType python compiler sage
" to avoid sage to detach a file every time it is saved
autocmd Filetype python,cython set backupcopy=yes
autocmd FileType python setlocal textwidth=75

""""""
" Tex settings
autocmd Filetype tex set backupcopy=yes
"autocmd FileType tex setlocal textwidth=78

""""""
" Text settings
" autocmd FileType text setlocal textwidth=78

set backspace=indent,eol,start

" Don't use Ex mode, use Q for formatting
map Q gq

" Press i to enter insert mode, and ii to exit.
" :imap ii <Esc>
:imap jj <Esc>

" Two semicolons are easy to type.
" :imap ;; <Esc>

" In many terminal emulators the mouse works just fine, thus enable it.
set mouse=a

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler
" (happens when dropping a file on gvim).
autocmd BufReadPost *
  \ if line("'\"") > 0 && line("'\"") <= line("$") |
  \   exe "normal! g`\"" |
  \ endif

""""""
"Spell checking 
":setlocal spell spelllang=en_us,fr

" Spelling taken from http://witerdom.com/2008/06/gmailvim
map <Leader>se :setlocal spell spelllang=en_us<CR>
map <Leader>sf :setlocal spell spelllang=fr<CR>
map <Leader>ss :setlocal spell spelllang=es_es<CR>
map <Leader>sn :setlocal nospell<CR> 

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
	 	\ | wincmd p | diffthis

" Command pour enregistrer et faire make (prefixe :W sera suffisant)
command WM w | make

" trailing whitespaces
"highlight ExtraWhitespace ctermbg=red guibg=red
"au ColorScheme * highlight ExtraWhitespace guibg=red
"au BufEnter * match ExtraWhitespace /\s\+$/
"au InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
"au InsertLeave * match ExtraWhiteSpace /\s\+$/

" tab chars and trailing spaces (harald schilly) (replace 0 by unicode)
"set list listchars=tab0,trail0,nbsp 

" folding (harald schilly)
"set foldmethod=indent
"set foldnestmax=2
"set foldlevelstart=1

" je pense que cest la ligne suivante qui gele mon vim
nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>

"vnoremap <Space> zf
"
" Ajouter une ligne en mode normal (Sage Days 57, Cernay)
" http://vim.wikia.com/wiki/Insert_newline_without_entering_insert_mode
" (le premier ne marche pas)
" Désactivé le 26 mai 2014 car 607<enter> fait geler mon vim
"nmap <S-Enter> O<Esc>j
"nmap <CR> o<Esc>k

" Timo Jolivet folding trick (18 juin 2014)
" peut-être qu'il faut desactiver l'autre pour que ça fonctionne bien
" autocmd FileType python set foldmethod=indent
" autocmd FileType python set foldnestmax=2
"

" instead of set paste vs set nopaste
set pastetoggle=<F10>

" pour regénérer le fichier .spl
" https://www.reddit.com/r/vim/comments/5zhpre/whats_the_difference_between_addspl_and_add/
" TODO: le faire que si le spl est plus vieux que ce fichier
" mkspell ~/.vim/spell/en.utf-8.add
