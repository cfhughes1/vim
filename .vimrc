" Colorscheme

set t_Co=256

set background=dark

syntax enable

colors zenburn


" Tabs and line numbers

filetype indent on

set tabstop=4

set shiftwidth=4

set expandtab

set number

autocmd FileType javascript setlocal ts=2 sts=2 sw=2


" Highlight searches

set hlsearch


" Key mappings

inoremap <C-e> <Esc>

nnoremap ; :

" nnoremap <Space>t :Vexplore<cr>

noremap <Space>t :call VexToggle(getcwd())<CR>


" netrw mods

let g:netrw_banner=0

let g:netrw_liststyle=3

let g:netrw_altv=1

let g:netrw_winsize=25

let g:netrw_special_syntax=1

autocmd FileType netrw setl bufhidden=wipe

fun! VexOpen(dir)

    let g:netrw_browse_split=4 

    let vex_width = 25


    execute "Vexplore " . a:dir

    let t:vex_buf_nr = bufnr("%")

    wincmd H


    call VexSize(vex_width)

endf


fun! VexClose()

    let cur_win_nr = winnr()

    let target_nr = ( cur_win_nr == 1 ? winnr("#") : cur_win_nr )


    1wincmd w

    close

    unlet t:vex_buf_nr


    execute (target_nr - 1) . "wincmd w"

    call NormalizeWidths()

endf


fun! VexSize(vex_width)

    execute "vertical resize" . a:vex_width

    set winfixwidth

    call NormalizeWidths()

endf


fun! NormalizeWidths()

    let eadir_pref = &eadirection

    set eadirection=hor

    set equalalways! equalalways!

    let &eadirection = eadir_pref

endf


fun! VexToggle(dir)

    if exists("t:vex_buf_nr")

        call VexClose()

    else

        call VexOpen(a:dir)

    endif

endf


" stuff for flake8 checking

execute pathogen#infect()

source /home/c/.vim/bundle/vim-flake8/ftplugin/python_flake8.vim

autocmd BufWritePost *.py call Flake8()

let g:flake8_show_in_gutter=1

let g:flake8_max_markers=500

highlight link Flake8_Error      Error

highlight link Flake8_Warning    WarningMsg

highlight link Flake8_Complexity WarningMsg

highlight link Flake8_Naming     WarningMsg

highlight link Flake8_PyFlake    WarningMsg" Colorscheme

set t_Co=256

set background=dark

syntax enable

colors zenburn


" Tabs and line numbers

filetype indent on

set tabstop=4

set shiftwidth=4

set expandtab

set number


" Highlight searches

set hlsearch


" Key mappings

inoremap <C-e> <Esc>

nnoremap ; :

" nnoremap <Space>t :Vexplore<cr>

noremap <Space>t :call VexToggle(getcwd())<CR>


" netrw mods

let g:netrw_banner=0

let g:netrw_liststyle=3

let g:netrw_altv=1

let g:netrw_winsize=25

let g:netrw_special_syntax=1

autocmd FileType netrw setl bufhidden=wipe

fun! VexOpen(dir)

    let g:netrw_browse_split=4 

    let vex_width = 25


    execute "Vexplore " . a:dir

    let t:vex_buf_nr = bufnr("%")

    wincmd H


    call VexSize(vex_width)

endf


fun! VexClose()

    let cur_win_nr = winnr()

    let target_nr = ( cur_win_nr == 1 ? winnr("#") : cur_win_nr )


    1wincmd w

    close

    unlet t:vex_buf_nr


    execute (target_nr - 1) . "wincmd w"

    call NormalizeWidths()

endf


fun! VexSize(vex_width)

    execute "vertical resize" . a:vex_width

    set winfixwidth

    call NormalizeWidths()

endf


fun! NormalizeWidths()

    let eadir_pref = &eadirection

    set eadirection=hor

    set equalalways! equalalways!

    let &eadirection = eadir_pref

endf


fun! VexToggle(dir)

    if exists("t:vex_buf_nr")

        call VexClose()

    else

        call VexOpen(a:dir)

    endif

endf


" stuff for flake8 checking

execute pathogen#infect()

source /home/c/.vim/bundle/vim-flake8/ftplugin/python_flake8.vim

autocmd BufWritePost *.py call Flake8()

let g:flake8_show_in_gutter=1

let g:flake8_max_markers=500

highlight link Flake8_Error      Error

highlight link Flake8_Warning    WarningMsg

highlight link Flake8_Complexity WarningMsg

highlight link Flake8_Naming     WarningMsg

highlight link Flake8_PyFlake    WarningMsg
