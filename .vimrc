" VIMRC
" Create by Jeoffrey Bauvin
" v0.2 - 22/10/2012

" Completion {{{
" Show a popup even if there's only one option
" Show preview window
"Complete to longest common substring
set completeopt=menuone,preview,longest
set wildmode=longest:full,full

" jj fait Echap en Insert mode
inoremap jj <Esc>

" Active la numérotation des lignes
set number

" Coloration syntaxique
colorscheme koehler
filetype plugin indent on
syntax on

" Active la souris
set mouse=a

" Montre les commandes incomplètes
set showcmd

" Active l'autoindentation
 set autoindent

" Désactive la compatbilité avec l'ancien VI
" set nocompatible

" Défini l'historique à 100
set history=100

" Afficher les parenthèses correspondantes
set showmatch

" Active le surlignage lors des recherches
set hlsearch

" Afficher les résultats de la recherche au moment de la saisie
set incsearch

" Permet de revenir à la dernière position connue quand on réouvre le fichier
if has("autocmd")
	filetype plugin indent on
    		autocmd FileType text setlocal textwidth=78

	" always jump to last edit position when opening a file
	autocmd BufReadPost *
	\ if line("'\"") > 0 && line("'\"") <= line("$") |
		\   exe "normal g`\"" |
	\ endif
 endif

" Permet de surligner la ligne actuelle
"set cursorline
"hi Cursorline ctermbg=darkgrey ctermfg=none 

" Indentation à la marque de Tab la plus proche
set shiftround

" Désactive la casse lors de la recherche
set ignorecase
set smartcase

" Active la détection du type de fichier
filetype on

" Correction orthographique
" set spelllang =fr
" set spell
" set spellsuggest =5

" Raccourci (<? -> <?php)
iab <? <?php

function! InsertStatuslineColor(mode)
  if a:mode == 'i'
    hi statusline ctermfg=6 ctermbg=DarkRed
  elseif a:mode == 'r'
    hi statusline ctermfg=5 ctermbg=black
  else
    hi statusline ctermfg=1 ctermbg=black
  endif
endfunction

au InsertEnter * call InsertStatuslineColor(v:insertmode)
au InsertLeave * hi statusline ctermfg=DarkRed ctermbg=black

" default the statusline to green when entering Vim
hi statusline ctermfg=red ctermbg=black

"Status line gnarliness
"set laststatus=2
"set statusline=%F%m%r%h%w\ (%{&ff}){%Y}\ [%l,%v]-[%p%%]


