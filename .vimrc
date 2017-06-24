"na początek kilka przypominaczy:
" 1. alternatywne wyjście z trybu edycji: ctrl-[ lub zamapowane klawisze
" 2. zaznaczanie blokowe tekstu (np slupek slow) ctrl-v
" 3. listowanie wyszukanego  tekstu - najpierw /szukaj, pozniej :g//
" 4. zaznaczanie całego tekstu: ggVG
" 5. manipulacja podzielonym ekranem (split,vsplit) - :res +5 :res -5 lub
" 6. kopiowanie zaznaczonego tekstu do linii polecen: :ctrl+R i pozniej  "
" 7. kopiowanie i wklejanie w ubuntu: paste (srodkowy myszy), copy ctrl+shift+c

""" K O L O R Y <<<
"
"kolory w putty. TO_DO - zwykly terminal?
"set t_Co=256

syntax on
if has('gui_running')
	colorscheme torte
else
	colorscheme elflord
endif

"kolory komentarzy na zielono a linii na szaro
highlight Comment ctermfg=darkgreen
"highlight Comment guifg=darkgreen
highlight LineNr ctermfg=darkgrey
highlight LineNr guifg=darkgrey

"kolor kursora
highlight Cursor guifg=black guibg=green
highlight iCursor guifg=black guibg=red
set guicursor=n-v-c:block-Cursor
set guicursor+=i:ver25-iCursor
set guicursor+=n-v-c:blinkon0
set guicursor+=i:blinkwait10
"podkreslenie w momencie edycji
:autocmd InsertEnter,InsertLeave * set cul!
"TERM - kolor kursora
"if &term =~ "xterm\\|rxvt\\|screen"
" use an orange cursor in insert mode
"let &t_SI = "\<Esc>]12;red\x7"
" use a red cursor otherwise
"let &t_EI = "\<Esc>]12;yellow\x7"
"silent !echo -ne "\033]12;yellow\007"
" reset cursor when vim exits
"autocmd VimLeave * silent !echo -ne "\033]12\007"
" use \003]12;gray\007 for gnome-terminal and rxvt up to version 9.21
"endif

""" O G O L N E <<<
"
set nu
set nowrap
set hlsearch
set nocompatible 
set textwidth=0		"defaultowo nie zawijamy wierszy
set ruler
set rulerformat=%40(%t/%y/%{&fenc}/%{&ff}%=%l,%c%V%5(%P%)%)
""" P O W L O K A <<<
"
"nnoremap <F6> :!python3 %<CR>
"autocmd filetype sh nnoremap <F5> :!bash %<CR>
"autocmd filetype cpp nnoremap<F5> :!g++ % -ggdb -o %:r && ./%:r <CR>
"jesli powyzsze nie wystarczy to plugin singlecompile 
"(odhaszuj w sekcji vundle)

""" M A P O W A N I E <<<
"
"split navigations czyli skakanie po oknaj jak w tekscie vima
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
"mapowanie klawisza wyjscia z insert jj/tab do wyboru i testu
"wiecej na http://vim.wikia.com/wiki/Avoid_the_escape_key
"tam tez: TAB MOZNA wpisywac przez \ <tab> (trzeci inoremap)
"
"czasy opóźnienia jeśli jj za szybko to zwieksz timeoutlen
"set timeout timeoutlen=200 ttimeoutlen=10
inoremap jj <Esc>
"nnoremap <Tab> <Esc>
"vnoremap <Tab> <Esc>gV
"onoremap <Tab> <Esc>
"inoremap <Tab> <Esc>`^
"inoremap <Leader><Tab> <Tab>
" wstawianie daty do pliku pod klawiszem F2
map <F2> a<C-R>=strftime("%c")<CR><Esc>
"zamykanie nawiasow
inoremap ( ()<Esc>i
inoremap [ []<Esc>i
autocmd Filetype c,cpp inoremap { {<CR>}<Esc>O

""" F U N K C J E <<<
"
" wyszukiwanie jak w notepadzie ++: :vimgrep /fraza/ % , :copen
" lub funkcja i remap (w copen podalem domyslna wysokosc okna:
function! FindAll()
	call inputsave()
	let p = input('Enter pattern:')
	call inputrestore()
	execute 'vimgrep "'.p.'" % |copen 10'
endfunction
nnoremap <F7> :call FindAll()<cr>

""" Tweaks for browsing <<<
"
let g:netrw_banner=0        " disable annoying banner
let g:netrw_browse_split=4  " open in prior window
let g:netrw_altv=1          " open splits to the right
let g:netrw_liststyle=3     " tree view
let g:netrw_list_hide=netrw_gitignore#Hide()
let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'
" Display all matching files when we tab complete
set path+=**
set wildmenu

"" G V I M <<<
"
set guifont=Liberation\ Mono\ 12
set encoding=utf-8
" TO_DO - odpalic ponizsze tylko jesli uruchamiasz gvima ,bo terminal sie psuje

syntax on
if has('gui_running')
	set lines=99 columns=999
	set guioptions-=T
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Vundle
"filetype off
" set the runtime path to include Vundle and initialize
"set rtp+=~/.vim/bundle/Vundle.vim
"call vundle#begin()
" let Vundle manage Vundle, required
"Plugin 'gmarik/Vundle.vim'
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"Plugin 'vim-airline/vim-airline'
"otwierasz airline przy pojedynczym oknie
"set laststatus=2
"likwidacja opoznienia przy zmianie koloru z insert do normal
"set ttimeout
"set ttimeoutlen=100
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"Plugin 'scrooloose/nerdtree'
"szerokosc otwieranego okna
"let g:NERDTreeWinSize=90
"mapowanie ctrl-n do otwierania nerdtree
"map <C-n> :NERDTreeToggle<CR>
map <C-n> :Lexplore<CR>
" close vim if the only window left open is a NERDTree
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" let NERDtree show hidden files
"let NERDTreeShowHidden=1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"All of your Plugins must be added before the following line
"call vundle#end()            " required
filetype plugin indent on    " required

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
