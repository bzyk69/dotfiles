" na początek kilka przypominaczy:
" 1. alternatywne wyjście z trybu edycji: ctrl-[ lub ctrl-C lub
" 2. zaznaczanie blokowe tekstu (np slupek slow) ctrl-v
" 3. listowanie wyszukanego  tekstu - najpierw /szukaj, pozniej :g//
" 4. zaznaczanie całego tekstu: ggVG
" 5. manipulacja podzielonym ekranem (split,vsplit) - :res +5 :res -5 lub
" 6. kopiowanie zaznaczonego tekstu do linii polecen: :ctrl+R " lub w windows 
"    ctrl-R * - patrz w :reg gdzie jest skopiowany tekst
" 7. makra i rejestry - bardzo przydatne narzedzia!! zawartosc rejestru 
"    modyfikujesz przez :let @a'rejestr' i Enter. gdzie @a to dany rejestr a
"    zawartosc rejestru wrzucasz przez ctrl-R <litera rejestru>. 
"    wiecej na http://vim.wikia.com/wiki/Macros

""" K O L O R Y <<<
"
syntax on
colorscheme torte
"kolor numerowania wierszy
:highlight Comment ctermfg=darkgreen
"highlight Comment guifg=darkgreen
highlight LineNr guifg=darkgrey

"kolor kursora
highlight Cursor guifg=black guibg=green
highlight iCursor guifg=white guibg=red
set guicursor=n-v-c:block-Cursor
set guicursor+=i:ver25-iCursor
set guicursor+=n-v-c:blinkon0
set guicursor+=i:blinkwait10

""" O G O L N E <<<
"
set nu 
set nowrap
set hlsearch
set nocompatible 
set textwidth=0					"defaultowo nie łamiemy wierszy
au BufNewFile,BufRead *.txt set wrap tw=79	"zawijamy wiersze w plikach tekstowych
set ruler
set rulerformat=%40(%t/%y/%{&fenc}/%{&ff}%=%l,%c%V%5(%P%)%)
""" P O W L O K A <<<
"
"nnoremap <silent> <F5> :!python3 %<CR>
"autocmd filetype cpp nnoremap<F5> :!g++ % -ggdb -o %:r && ./%:r <CR>
"
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
inoremap ( ()<Esc>:let leavechar=")"<CR>i
inoremap [ []<Esc>:let leavechar="]"<CR>i
imap <C-j> <Esc>:exec "normal f" . leavechar<CR>a
autocmd Filetype c,cpp inoremap { {<CR>}<Esc>O

""" F U N K C J E <<<
"
" wyszukiwanie jak w notepadzie ++:
function! FindAll()
	call inputsave()
	let p = input('Enter pattern:')
	call inputrestore()
        execute 'vimgrep "'.p.'" % |copen 15'
endfunction
nnoremap <F7> :call FindAll()<cr>

""" W I N D O W S <<<
"
"font dla windowsa
set guifont=Liberation\ Mono:h12:cDEFAULT
"kodowanie
set encoding=utf-8
"rozmiar okna
set lines=99 columns=129
"ukrywa gorna belke
set guioptions-=T
" copy and paste
"set clipboard=unnamed (byc moze potrzebne?)
vmap <C-c> "+yi
"kopiowanie w trybie normal (w normal podwojne ctrl-v) lub insert
vmap <C-v> c<ESC>"+p
imap <C-v> <ESC>"+pa
" lokalizacja menu
set langmenu=en_US
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim


""" P L U G I N Y <<<
"
" Caly vimfiles jest na dropboxie w kat.konfigi
" a jesli nie ma to jak ponizej
" airline instalujesz kopiując zawartosc folderu z pluginem i tematami
" bezposrednio do katalogu vimfiles 
" airline - wlaczony nawet gdy jedno okno
"set laststatus=2
"NERDTree - mapowanie klawisza
"map <C-n> :NERDTreeToggle<CR>
map <C-n> :Lexplore<CR>
"NERDTree - close vim if the only window left open is a NERDTree
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
"NERDTree - szerokosc okna
"let g:NERDTreeWinSize=90
" ident plugin ma byc na koncu
filetype plugin indent on

" Tweaks for browsing
let g:netrw_banner=0        " disable annoying banner
let g:netrw_browse_split=4  " open in prior window
let g:netrw_altv=1          " open splits to the right
let g:netrw_liststyle=3     " tree view
let g:netrw_list_hide=netrw_gitignore#Hide()
let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'
" Display all matching files when we tab complete
set path+=**
set wildmenu

