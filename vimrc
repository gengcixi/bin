if has("cscope")
	set csprg=/usr/bin/cscope
	set csto=0
	set cst
	set nocsverb
	" add any database in current directory
	if filereadable("cscope.out")
		cs add cscope.out
	" else add database pointed to by environment
	elseif $CSCOPE_DB != ""
		cs add $CSCOPE_DB
	endif
	set csverb
endif

syntax on
set cul "高亮光标所在行
set scrolloff=3     " 光标移动到buffer的顶部和底部时保持3行距离
set nocompatible  "去掉讨厌的有关vi一致性模式，避免以前版本的一些bug和局限  

set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}   "状态行显示的内容  
set laststatus=2    " 启动显示状态行(1),总是显示状态行(2)  

set sw=4
set ts=4
set nu
" 自动缩进
set autoindent
set hlsearch

"搜索忽略大小写
set ignorecase

" 高亮显示匹配的括号
set showmatch
" 匹配括号高亮的时间（单位是十分之一秒）
set matchtime=1
" 光标移动到buffer的顶部和底部时保持3行距离
set scrolloff=3

colorscheme ron

let Tlist_Show_One_File=1     "不同时显示多个文件的tag，只显示当前文件的    
let Tlist_Exit_OnlyWindow=1   "如果taglist窗口是最后一个窗口，则退出vim   
" let Tlist_Ctags_Cmd="/usr/bin/ctags" "将taglist与ctags关联  
