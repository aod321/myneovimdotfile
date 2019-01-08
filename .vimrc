"设置编码
set encoding=utf-8
" 让配置变更立即生效
autocmd BufWritePost $MYVIMRC source $MYVIMRC
call plug#begin()    

"" assuming you're using vim-plug: https://github.com/junegunn/vim-plug
    "Plug 'ncm2/ncm2'
    "Plug 'roxma/nvim-yarp'
"
    "" enable ncm2 for all buffers
    "autocmd BufEnter * call ncm2#enable_for_buffer()
"
    "" IMPORTANT: :help Ncm2PopupOpen for more information
    "set completeopt=noinsert,menuone,noselect
"
    "" NOTE: you need to install completion sources to get completions. Check
    "" our wiki page for a list of sources: https://github.com/ncm2/ncm2/wiki
    "Plug 'ncm2/ncm2-bufword'
    "Plug 'ncm2/ncm2-tmux'
    "Plug 'ncm2/ncm2-path'
    "Plug 'ncm2/ncm2-pyclang'
    "Plug 'OmniSharp/omnisharp-vim'
    Plug 'Valloric/YouCompleteMe'
    Plug 'icymind/NeoSolarized'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'junegunn/vim-easy-align'
    Plug 'jiangmiao/auto-pairs'

    "项目管理
    Plug 'fholgado/minibufexpl.vim'
    Plug 'scrooloose/nerdcommenter'
    Plug 'scrooloose/nerdtree'
    Plug 'Xuyuanp/nerdtree-git-plugin'
    Plug 'majutsushi/tagbar'
    Plug 'jistr/vim-nerdtree-tabs'



    "多余空格自动标红
    Plug 'ntpeters/vim-better-whitespace'




    Plug 'neomake/neomake'





call plug#end()

set termguicolors
set background=dark
set cursorline
set number
colorscheme NeoSolarized



set ts=4
set expandtab

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1
" Enable NERDCommenterToggle to check all selected lines is commented or not 
let g:NERDToggleCheckAllLines = 1

let g:python3_host_prog = '/usr/local/bin/python3'

" 定义快捷键的前缀，即<Leader>
let mapleader=";"

" 使用 NERDTree 插件查看工程文件。设置快捷键，速记：file list
nmap <Leader>fl :NERDTreeToggle<CR>
" 设置NERDTree子窗口宽度
let NERDTreeWinSize=32
" 设置NERDTree子窗口位置
let NERDTreeWinPos="right"
" 显示隐藏文件
let NERDTreeShowHidden=1
" NERDTree 子窗口中不显示冗余帮助信息
let NERDTreeMinimalUI=1
" 删除文件时自动删除文件对应 buffer
let NERDTreeAutoDeleteBuffer=1

"open NERDTree automatically when vim starts up on opening a directory
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

"自动打开NERDTree
"autocmd vimenter * NERDTree

"close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" 显示/隐藏 MiniBufExplorer 窗口
map <Leader>bl :MBEToggle<cr>
" buffer 切换快捷键
map gt :MBEbn<cr>
map gT :MBEbp<cr>


" Some customizations for YCM
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>


