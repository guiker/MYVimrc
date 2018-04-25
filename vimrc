"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" @version : 0.1 Beta
" @Author : guiker
" @Create Time : 04/25/2018
" @File Name : vimrc
" @Description : MYVimrc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 通用设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set shell=/bin/bash
" 定义快捷键的前缀，即<Leader>
let mapleader = ","
" 开启文件类型侦测
filetype on
" 根据侦测到的不同类型加载对应的插件
filetype plugin on
" 不让vim发出讨厌的滴滴声
set noerrorbells
" 不要使用vi的键盘模式，使用vim自己的
set nocompatible
" 去掉输入错误的提示
set noeb
" 告诉我们文件的哪一行被改变过
set report=0
set selection=exclusive
set selectmode=mouse,key

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 显示设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 开启语法高亮功能
syntax enable
" 允许指定语法高亮配色方案替换默认方案
syntax on
"默认配色方案
colorscheme darkblue
" 开启256色支持，默认是8色
set t_Co=256
" 命令行显示输入的命令
set showcmd         
" 命令行的高度
set cmdheight=2
" 命令行显示vim当前模式
set showmode
" 总是显示状态栏
set laststatus=2
" 开启行号显示
set number
" 显示光标当前位置
set ruler           
" 高亮显示当前行/列
set cursorline
" set cursorcolumn
" 用浅色高亮当前行
autocmd InsertEnter * se cul    
" 禁止显示菜单和工具条
set guioptions-=T           
set guioptions-=m           
" 禁止显示滚动条
set guioptions-=l
set guioptions-=L
set guioptions-=r
set guioptions-=R
" 字符间插入的像素行数目
set linespace=0
" 在被分割的窗口间显示空白，便于阅读
set fillchars=vert:\ ,stl:\ ,stlnc:\
" 高亮显示匹配的括号
set showmatch
" 匹配括号高亮的时间（单位是十分之一秒）
set matchtime=1
" 光标移动到buffer的顶部和底部时保持3行的距离
set scrolloff=3
" 带有如下符号的单词不要被换行分割
set iskeyword+=_,$,@,%,#,-
" 允许backspace和光标键跨越行边界
set whichwrap+=<,>,h,l
" 允许光标出现在最后一个字符的后面
set virtualedit=block,onemore   

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 代码缩进和排版
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" 设置自动缩进
set autoindent
" 设置使用C/C++语言的自动缩进方式
set cindent
" 设置C/C++语言的具体缩进方式
set cinoptions=g0,:0,N-s,(0
" 智能的选择对其方式
set smartindent
" 自适应不同语言的智能缩进
filetype indent on
" 将制表符扩展为空格
set expandtab
" 设置编辑时制表符占用空格数
set tabstop=4
" 设置格式化时制表符占用空格数
set shiftwidth=4
" 让vim把连续数量的空格视为一个制表符
set softtabstop=4
" 在行和段开始处使用制表符
set smarttab
" 历史文件中需要记录的行数
set history=1000
" 禁止折行
set nowrap
" 使用回格键正常处理indent,eol,start等
set backspace=2

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 搜索设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 高亮显示搜索结果
set hlsearch
" 开启实时搜索功能
set incsearch
" 搜索时大小写不敏感
set ignorecase
" 设置魔术
set magic                   

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 代码折叠
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 基于缩进或语法进行代码折叠
" set foldmethod=indent
set foldmethod=syntax
" 启动vim时关闭折叠代码
set nofoldenable

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 代码补全
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim自身命名行模式智能补全
set wildmenu
" 补全内容不以分割子窗口形式出现，只显示补全列表
set completeopt-=preview

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 缓存设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 禁止生成临时文件
set nobackup
set noswapfile
" 文件在vim之外修改过，自动重新读入
set autoread
" 设置自动保存
set autowrite
" 在处理未保存或只读文件的时候，弹出确认
set confirm

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 编码设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set langmenu=zh_CN.UTF-8
" 帮助系统设置为中文
set helplang=cn
" 设置编码格式
set termencoding=utf-8
set encoding=utf-8
" 使用utf-8或gbk打开文件
set fileencodings=utf-8,ucs-bom,gbk,cp936,gb2312,gb18030
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 新建文件设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd BufNewFile *.cpp,*.cc,*.c,*.hpp,*.h,*.sh,*.py exec ":call SetTitle()"
func SetTitle()
   if expand("%:e") == 'sh'
        call setline(1,"\#!/bin/bash")
        call append(line("."), "")
   elseif expand("%:e") == 'py'
        call setline(1,"#!/usr/bin/env python")
        call append(line("."),"# coding=utf-8")
        call append(line(".")+1, "")
    elseif expand("%:e") == 'cpp'
        call setline(1,"#include <iostream>")
        call append(line("."), "")
    elseif expand("%:e") == 'cc'
        call setline(1,"#include <iostream>")
        call append(line("."), "")
    elseif expand("%:e") == 'c'
        call setline(1,"#include <stdio.h>")
        call append(line("."), "")
    elseif expand("%:e") == 'h'
        call setline(1, "#pragma once")
    elseif expand("%:e") == 'hpp'
        call setline(1, "#pragma once")
    endif
        call setline(2,"#===================================")
        call setline(3,"# @Author:guiker")
        call setline(4,"# @Create Time:".strftime("%H:%M %d/%m/%Y"))
        call setline(5,"# @File Name:".expand("%"))
        call setline(6,"# @Description:")
        call setline(7,"#")
        call setline(8,"#===================================\n")
endfunc
autocmd BufNewFile * normal G

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vundle插件
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set rtp+=/opt/vim/bundle/Vundle.vim/
call vundle#begin('/opt/vim/bundle')

" NERDTree树
Plugin 'scrooloose/nerdtree'
" NERDTree git插件
Plugin 'Xuyuanp/nerdtree-git-plugin'
" NerdTree文件类型高亮
Plugin 'tiagofumo/vim-nerdtree-syntax-highlight'
" 显示文件类型图标
Plugin 'ryanoasis/vim-devicons'
" L9 Vim-script库
Plugin 'vim-scripts/L9'
" 支持文件的模糊搜索工具
Plugin 'ctrlpvim/ctrlp.vim'
" 强大的光标快速移动工具，强大到颠覆你的插件观
Plugin 'easymotion/vim-easymotion'
" 显示类/方法/变量
Plugin 'majutsushi/tagbar'
" 自动补全引号、圆括号、花括号等
Plugin 'jiangmiao/auto-pairs'
" 自动增加、替换配对符的插件
Plugin 'tpope/vim-surround'
" 快速注释代码插件
Plugin 'tpope/vim-commentary'
" 重复上一次操作
Plugin 'tpope/vim-repeat'
" 代码、注释、表格对齐
Plugin 'godlygeek/tabular'
" 基于字典的python语法补全
Plugin 'rkulla/pydiction'
" 根据文本颜色值显示对于的颜色
Plugin 'gorodinskiy/vim-coloresque'
" 目录比较
Plugin 'will133/vim-dirdiff'                                                                                                                       
" airline样式
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
" 模糊字符搜索插件
Plugin 'haya14busa/incsearch.vim'
" 随心所欲切换主题
Plugin 'chxuan/change-colorscheme'
" 优化搜索，移动光标后清除高亮
Plugin 'junegunn/vim-slash'
" onedark主题
Plugin 'joshdick/onedark.vim'
" 高亮配对符 需要从新编译VIM80支持python3
Plugin 'Valloric/MatchTagAlways'
" 代码缩进对齐线
Plugin 'Yggdroot/indentLine'
" 启动页
Plugin 'mhinz/vim-startify'


call vundle#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" load vim default plugin
runtime macros/matchit.vim


" nerdtree
" 自动启动NERDTree
autocmd VimEnter * NERDTree
" 设置宽度
let NERDTreeWinSize=25
" 将 NERDTree 的窗口设置在 vim 窗口的右侧（默认为左侧）
" let NERDTreeWinPos="right"
" 当打开 NERDTree 窗口时，自动显示 Bookmarks
let NERDTreeShowBookmarks=1
map <F3> :NERDTreeToggle<CR>
imap <F3> <ESC> :NERDTreeToggle<CR>
let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1
let g:NERDTreeHighlightFolders = 1         " enables folder icon highlighting using exact match
let g:NERDTreeHighlightFoldersFullName = 1 " highlights the folder name
let g:NERDTreeDirArrowExpandable='♥'
let g:NERDTreeDirArrowCollapsible='♥'
" 关闭窗口时自动关闭NerdTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" nerdtree-git-plugin
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }

" vim-devicons
set guifont=Droid\ Sans\ Mono\ for\ Powerline\ Nerd\ Font\ Complete\ 12

" ctrlp
let g:ctrlp_map = '<c-c>'
let g:ctrlp_cmd = ':CtrlP'
let g:ctrlp_working_path_mode = '0'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux

" vim-easymotion
let g:EasyMotion_smartcase = 1
map <Leader><Leader>j <Plug>(easymotion-j)
map <Leader><Leader>k <Plug>(easymotion-k)
map <Leader><Leader>h <Plug>(easymotion-linebackward)
map <Leader><Leader>l <Plug>(easymotion-lineforward)
map <Leader><Leader>. <Plug>(easymotion-repeat)
" <Leader>f{char} to move to {char}
map <Leader>f <Plug>(easymotion-bd-f)
nmap <Leader>f <Plug>(easymotion-overwin-f)
" Move to line
map <Leader>L <Plug>(easymotion-bd-jk)
nmap <Leader>L <Plug>(easymotion-overwin-line)
" Move to word
map <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)

" tagbar
" 用系统默认路径
" let g:tagbar_ctags_bin = '/usr/bin/ctags' "linux
" let g:tagbar_ctags_bin = '/usr/local/bin/ctags' "mac
let g:tagbar_width = 20
" 自动启动TagbarToggle
autocmd VimEnter * TagbarToggle
map <F4> :TagbarToggle<CR>
imap <F4>t <ESC> :TagbarToggle<CR>

" airline
let g:airline_theme="onedark"
" let g:airline_theme="luna"
let g:airline_powerline_fonts = 1
"let g:airline_section_b = '%{strftime("%c")}'
"let g:airline_section_y = 'BN: %{bufnr("%")}'
let g:airline#extensions#tabline#enabled = 1
" let g:airline#extensions#tabline#left_sep = ' '
" let g:airline#extensions#tabline#left_alt_sep = '|'
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" unicode symbols
  let g:airline_left_sep = '»'
  let g:airline_left_sep = '▶'
  let g:airline_right_sep = '«'
  let g:airline_right_sep = '◀'
  let g:airline_symbols.crypt = '🔒'
  let g:airline_symbols.linenr = '☰'
  let g:airline_symbols.linenr = '␊'
  let g:airline_symbols.linenr = '␤'
  let g:airline_symbols.linenr = '¶'
  let g:airline_symbols.maxlinenr = ''
  let g:airline_symbols.maxlinenr = '㏑'
  let g:airline_symbols.branch = '⎇'
  let g:airline_symbols.paste = 'ρ'
  let g:airline_symbols.paste = 'Þ'
  let g:airline_symbols.paste = '∥'
  let g:airline_symbols.spell = 'Ꞩ'
  let g:airline_symbols.notexists = '∄'
  let g:airline_symbols.whitespace = 'Ξ'

" old vim-powerline symbols
  let g:airline_left_sep = '⮀'
  let g:airline_left_alt_sep = '⮁'
  let g:airline_right_sep = '⮂'
  let g:airline_right_alt_sep = '⮃'
  let g:airline_symbols.branch = '⭠'
  let g:airline_symbols.readonly = '⭤'
  let g:airline_symbols.linenr = '⭡'
nnoremap <C-N> :bn<CR>
nnoremap <C-P> :bp<CR>

" incsearch.vim
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

" indentLine
let g:indentLine_enabled=0
nmap <Leader><Leader>il :IndentLinesToggle<CR>

" pydiction
let g:pydiction_location='/opt/vim/bundle/pydiction/complete-dict'
let g:pydiction_menu_height=10

" change-colorscheme
map <F10> :NextColorScheme<CR>
imap <F10> <ESC> :NextColorScheme<CR>
map <F9> :PreviousColorScheme<CR>
imap <F9> <ESC> :PreviousColorScheme<CR>



" 设置光标位置
autocmd VimEnter * wincmd w


