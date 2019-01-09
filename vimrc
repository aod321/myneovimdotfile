"设置编码
set encoding=utf-8
" 让配置变更立即生效
autocmd BufWritePost $MYVIMRC source $MYVIMRC
call plug#begin()    

    Plug 'Valloric/YouCompleteMe'
    Plug 'icymind/NeoSolarized'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'junegunn/vim-easy-align'
    Plug 'jiangmiao/auto-pairs'

    "缩进提示
    Plug 'Yggdroot/indentLine'
    "快速搜索定位
    Plug 'kien/ctrlp.vim'



    "项目管理
    Plug 'fholgado/minibufexpl.vim'
    Plug 'scrooloose/nerdcommenter'
    Plug 'scrooloose/nerdtree'
    Plug 'Xuyuanp/nerdtree-git-plugin'
    Plug 'majutsushi/tagbar'
    Plug 'jistr/vim-nerdtree-tabs'



    "多余空格自动标红
    "Plug 'ntpeters/vim-better-whitespace'




    Plug 'neomake/neomake'

    Plug 'vim-syntastic/syntastic'




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
" 使用tagbar
nmap <Leader>tb :TagbarToggle<CR>
" 设置NERDTree子窗口宽度
let NERDTreeWinSize=32
" 设置NERDTree子窗口位置
let NERDTreeWinPos="left"
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
let g:ycm_filetype_whitelist = {
			\ "c":1,
			\ "cpp":1,
			\ "objc":1,
			\ "sh":1,
			\ "zsh":1,
			\ "zimbu":1,
			\ "python":1,
			\ }

"强制语义补全快捷键
let g:ycm_key_invoke_completion = '<c-z>'
noremap <c-z> <NOP>


"自动语义补全
let g:ycm_semantic_triggers =  {
			\ 'c,cpp,python,java,go,erlang,perl': ['re!\w{2}'],
			\ 'cs,lua,javascript': ['re!\w{2}'],
			\ }

map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

"ctrlp.vim
map <leader>cp  :CtrlP<CR>

" Something for python

    """"""""""""""""""""""
    "Quickly Run
    """"""""""""""""""""""
    map <F5> :call CompileRunGcc()<CR>
    func! CompileRunGcc()
        exec "w"
        if &filetype == 'c'
            exec "!g++ % -o %<"
            exec "!time ./%<"
        elseif &filetype == 'cpp'
            exec "!g++ % -o %<"
            exec "!time ./%<"
        elseif &filetype == 'java'
            exec "!javac %"
            exec "!time java %<"
        elseif &filetype == 'sh'
            :!time bash %
        elseif &filetype == 'python'
            exec "!time python2.7 %"
        elseif &filetype == 'html'
            exec "!firefox % &"
        elseif &filetype == 'go'
    "        exec "!go build %<"
            exec "!time go run %"
        elseif &filetype == 'mkd'
            exec "!~/.vim/markdown.pl % > %.html &"
            exec "!firefox %.html &"
        endif
    endfunc



"Plugin indentLine settings.
let g:indentLine_char = "┆"
let g:indentLine_enabled = 1
let g:autopep8_disable_show_diff=1

"YCM python
let g:ycm_python_interpreter_path = '/usr/local/bin/python3'
let g:ycm_python_sys_path = ['', '/Library/Frameworks/Python.framework/Versions/3.7/lib/python37.zip', '/Library/Frameworks/Python.framework/Versions/3.7/lib/python3.7', '/Library/Frameworks/Python.framework/Versions/3.7/lib/python3.7/lib-dynload', '/Users/yinzi/Library/Python/3.7/lib/python/site-packages', '/Library/Frameworks/Python.framework/Versions/3.7/lib/python3.7/site-packages']
let g:ycm_extra_conf_vim_data = [
  \  'g:ycm_python_interpreter_path',
  \  'g:ycm_python_sys_path'
  \]
let g:ycm_global_ycm_extra_conf = '~/global_extra_conf.py'

"Syntastic Recommended settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_python_checkers = ['pylint']
"let g:syntastic_aggregate_errors = 1



