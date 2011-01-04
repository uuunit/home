
" [ Base 基本 ]"{{{
""""""""""""""""""""""""""""""""""""""""""""

" 行号
set nu

" 自动换行，默认开启
"set wrap

" [ wrap开启 / list关闭 才可生效 ] 在单词中间断行,适用于终端自适应宽度
set linebreak
set formatoptions+=mB
" m 表示允许在两个汉字之间断行， 即使汉字之间没有出现空格。B 表示将两行合并为一行的时候， 汉字与汉字之间不要补空格

set mouse=a
set history=50

" 即使当前已修改 buffer 未保存仍可以切换到其他 buffer
set hidden

" 编辑文件不产生备份文件
set nobackup

" 去除警示声
set noerrorbells
set novisualbell
set vb t_vb=

" 除($，^，.，*)外的正则特殊符号需加"\"转义
set magic

" 保留粘贴的代码格式，与 autoclose，acp，xml 插件冲突
"set paste
" 关于粘贴/复制
" X11 模式：按住 Shift 再使用鼠标选中,会选中行号

" 处理未保存或只读文件的时候，弹出确认
set confirm

" 使用 vim 的扩展功能，不兼容 vi
set nocompatible

" vim 工作编码,以何种编码显示，文件编码与之不匹配，则iconv转换[?]
" 参考：http://www.rainux.org/blog/index.php/2005/10/20/106
set encoding=utf-8

" 新建/保存文件使用编码
set fileencoding=utf-8

" 文件编码匹配原则：由大到小（有利于找到合适编码）
"set fencs=utf-8,usc-bom,euc-jp,gb18030,gbk,gb2312,cp936
set fileencodings=ucs-bom,utf-8,cp936,gbk,gb2312,gb18030,big5,euc-jp,euc-kr,latin1

" utf8 指定 字符 宽度，防止 某些字符 只显示 半个
"set ambiwidth=double

" 文件在外部被修改，会自动读取更新
set autoread

"启用文件类型检测和文件类型插件，支持缩进、高亮
filetype plugin indent on

" 可以在有缩进，行首继续删除上一行，删除字数不限定在刚输入的字数 
"set backspace=indent,eol,start

"方向键实现换行移动
set whichwrap=b,s,<,>,[,]

" 命令行显示 Tab 进入候选菜单
set wildmenu

" Tab 显示可选项，自动补全"公共"包含部分
set wildmode=list:longest
"set wildmode=longest:full

"自动切换当前目录为当前文件所在的目录
set autochdir

" 如果 autochdir 不支持
":cd %:p:h      " 类Unix
"au BufEnter * :cd! %:p:h
":lcd %:p:h     " 所有操作系统
"autocmd BufEnter * lcd %:p:h

" ~/.viminfo 保存打开文件历史（书签、寄存器、命令行历史……）
"set viminfo='5,f0,<0,s0,:5,h
"set viminfo+=!
set viminfo=

" 注释/* ... */ 换行，自动添加空格和星号 :h fo-table
"set formatoptions=cmMoqrt

" 全文循环 搜索查找 
"set nowrapscan


"}}}

" [ Style 样式 ]"{{{
""""""""""""""""""""""""""""""""""""""""""""

" 取消粗体
""set t_md=

syntax on

" 终端支持256色
set t_Co=256


"" 配合 screen 的256色显示
""if $TERM =~ '^xterm' || $TERM =~ '^screen' || has("gui_running")
""    if !has("gui_running")
""        set t_Co=256
""    endif
""    "colorscheme wombat256
""else
""    "colorscheme xoria
""endif

" 色彩主题
if(has("gui_running"))
    colorscheme xemacs
    set cursorline
else
    colorscheme wombat256
    "colorscheme xoria256
    " 高亮选择的当前行/列，类似 瞄准线
    set cursorline
    "set cursorcolumn
endif


"colorscheme jellybeans
"colorscheme xoria

" tab 可见
set list
" 显示 tab 的填充字符，间隔号输入：ctrl-v u00b7
set listchars=tab:\|\ ,trail:·

"行号栏的宽度
"set numberwidth=4

"高亮字符，让其不受100列限制
":highlight OverLength ctermbg=red ctermfg=white guibg=red guifg=white
":match OverLength '\%101v.*'

" 在被分割的窗口间显示空白，便于阅读
"set fillchars=vert:\ ,stl:\ ,stlnc:\

" 命令行（在状态行下）的高度，默认为1，这里是2
"set cmdheight=1

" 不显示statusLine，(默认值为1 至少2个窗口显示/2 总是显示)
set laststatus=0

" ruler 显示 在最低端，statusLine 下方，内容会随 鼠标/命令执行返回 而变化！
set ruler
"set rulerformat=%80([%f%m%r%h%w]\ [%Y]\ [%p%%][%l,%v][%L]%)
""set rulerformat=%50(%2*%<%f%=\ %m%r\ [%L]\ %3l\ %c\ %p%%%)

" 状态栏 statusLine 样式
"highlight StatusLine guifg=SlateBlue guibg=Yellow
"highlight StatusLineNC guifg=Gray guibg=White

""set statusline=[%F%m%r%h%w]\ [%{&ff}]\ [%Y]\ [%p%%][%l,%v][\ %L\ ]
"set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}
"set statusline=%F%m%r,%Y,%{&fileformat}\ \ \ ASCII=\%b,HEX=\%B\ \ \ %l,%c%V\ %p%%\ \ \ [\ %L\ lines\ in\ all\ ]


"}}}

" [ Advanced 扩展 ]"{{{
""""""""""""""""""""""""""""""""""""""""""""

" 缩进之后仍然保持选择模式
noremap < <gv | vnoremap > >gv

" 默认查看帮助文档时开启行号
autocmd FileType help set nu

" 在 normal/visual 模式，K 查看光标下关键词的帮助
set keywordprg=:help

" 默认使用中文帮助，:help @cn
set helplang=cn
"if version >= 603 
"   set helplang=cn
"endif

" 自动读取 vim 配置，使之马上生效
"autocmd! bufwritepost vimrc source ~/.vimrc

"取消每次退回到normal模式光标都退到当前光标前一个位置
"inoremap <Esc> <C-O>mp<Esc>`p

" 开关 行号显示
"nnoremap <F10> :set nu! nu?<CR>

" screen 中 选择 粘贴
"set ttymouse=xterm2



"}}}

" [ Match 匹配 ]"{{{
""""""""""""""""""""""""""""""""""""""""""""

"搜索随输入匹配
set incsearch

"高亮匹配关键字
set hlsearch

"搜索时忽略大小写，但在有一个或以上大写字母时仍保持对大小写敏感
set ignorecase smartcase

" 匹配括号时，高亮对应匹配
set showmatch

" 插入成对的括号时，会在指定的时间里提示匹配范围
set matchtime=2

"匹配括号的规则，增加针对html的<>
"set matchpairs=(:),{:},[:],<:>


"}}}

" [ Indent 缩进 ]"{{{
""""""""""""""""""""""""""""""""""""""""""""

" ? [输入]空格代替制表符，文本不再出现 tab [?]，被空格取代
" 要输入 tab，使用 ctrl-v <tab>
set expandtab

" tab 对应4个空格宽度，python，平衡
set tabstop=4

" shift >> / cindent 缩进时等价的空格长度
set shiftwidth=4

" 非空字符后使用正在的tab，空字符下使用 shiftwidth定义的空格长度替换tab 
""set smarttab

" 4个空格-->进位为1个tab( 类似四舍五入进位 ) [添加/删除]
" vim 会尽量将 多个空格转换制表符，以减少存储字符数
set softtabstop=4

" 开关 行号 与 tab/空白 填充符，使用 setlocal，仅对当前 buffer 生效
nnoremap <F10> :setl nu! list! paste!<CR>


"}}}

" [ Tab 缩进 ]"{{{
""""""""""""""""""""""""""""""""""""""""""""

" 换行时自动缩进
set autoindent

" 换行时自动缩进，与autoindent一同，比 cindent 好
set smartindent

" C样式的缩进，开启会覆盖 smartindent !
"set cindent

"}}}

" [ Tabpage 标签页 ]"{{{
""""""""""""""""""""""""""""""""""""""""""""

" tabnew <==> tabedit
nmap te  :tabedit 
nmap to  :tabnew<CR>
nmap tc  :tabclose<CR>
nmap tk  :bd<CR>
nmap tm  :tabmove<CR>
nmap tp  :tabprev<CR>
nmap tn  :tabnext<CR>
nmap th  :tab help 
nmap t.  :tabnew .<CR>
"nmap tf  :tabnew ~/.vimrc<CR>

nmap <F1>       :tabprev<CR>
nmap <F2>       :tabnext<CR>


" 在 两个 tabpage 之间 快速切换
autocmd TabLeave * let g:LastUsedTabPage=tabpagenr()
function! SwitchLastUsedTab()
    if exists("g:LastUsedTabPage")
        execute "tabnext" g:LastUsedTabPage
    endif
endfunction
" 快捷键
nmap tt :call SwitchLastUsedTab()<CR>


" fill 没有标签地方，sel 当前 活动的标签页 line 非活动的标签页
highlight TabLineFill ctermfg=0
highlight TabLine ctermfg=15 ctermbg=0 cterm=none
highlight TabLineSel ctermfg=7 cterm=bold ctermbg=6


" [ 标签页样式 ]"{{{
"""""""""""""""""""""""""""""""""""""""""""""
function MyTabLine()
    let s = ''
    for i in range(tabpagenr('$'))
        " select the highlighting
        if i + 1 == tabpagenr()
            let s .= '%#TabLineSel#'
        else
            let s .= '%#TabLine#'
        endif

        " set the tab page number (for mouse clicks)
        ""let s .= '%' . (i + 1) . 'T'.(i+1).''
        " 标签号与文件名之间 添加空格，用 方括号 标注 标签号
        let s .= ' [%' . (i + 1) . 'T'.(i+1).']'

        " the filename is made by MyTabLabel()
        ""let s .= '%{MyTabLabel(' . (i + 1) . ')}  '
        " 修改标志符 与 标签最后 包含一个 空格"
        let s .= '%{MyTabLabel(' . (i + 1) . ')} '
    endfor

    " after the last tab fill with TabLineFill and reset tab page nr
    let s .= '%#TabLineFill#%T'

    return s
endfunction

function MyTabLabel(n)
    let buflist = tabpagebuflist(a:n)
    let winnr = tabpagewinnr(a:n)
    let fullname = bufname(buflist[winnr - 1])
    "let fullname = substitute(fullname,"(\w){1}\w*/","\1/","g")
    let fullname = substitute(fullname,".*/","","")
    let fullname = empty(fullname) ? '[No Name]' : fullname
    if getbufvar(buflist[winnr - 1],"&mod")
        let modified = "+"
    else
        ""let modified = " "
        let modified = " "
    endif
    " 标志符 在最后面
    "return fullname.modified
    " 标志符 在编号后面
    return modified.fullname
endfunction

if version >= 700
    " Use the above tabe naming scheme
    set tabline=%!MyTabLine()
endif

"}}}


"}}}

" [ map 快捷键 ]"{{{
""""""""""""""""""""""""""""""""""""""""""""

" 防止 快捷键 映射 对,在进行解释映射
""nnoremap ,, ,
" 使用 :echo mapleader 查看定义
let mapleader = ","
let g:mapleader = ","

" 可以按键：o t 

" 默认 leader 为 \ 
" :up 与 :w 类似，但是仅当缓冲区修改后才写入
nnoremap <leader>w :up<cr>
" comment.vim 注释插件 快捷键 占用
"nnoremap <leader>x :x<cr>
nnoremap <leader>k :bd<cr>
nnoremap <leader>q :q<cr>
nnoremap <leader>t :set filetype=conf
" 与 w 的移动重叠，造成延迟
""nnoremap ws     :close<CR>

nnoremap <leader>l :ls<cr>
nnoremap <leader>d :bd<cr>

" 空格开关折叠
"nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>
nnoremap <space> za
nnoremap <CR> <C-f>
""nnoremap <space> <C-d>

"nnoremap <leader>st :set list<cr>
"nnoremap <leader>ct :set nolist<cr>
"
"nnoremap <leader>sn :set nu<cr>
"nnoremap <leader>cn :set nonu<cr>
"
"nnoremap <leader>sp :set paste<cr>
"nnoremap <leader>cp :set nopaste<cr>

" 命令行快捷键 cnoremap，可以实现比 :ca 命令行缩写 更快捷，自动展开，长目录定位
" 打开 txt 文件时容易展开
" cno     tx      ~/me/text/
cno     xx      ~/me/text/
cno     xh      ~/me/text/arch/
cno     xs      ~/me/text/soft/
cno     xv      ~/me/text/vi.vim/
cno     xf      ~/me/text/fvwm/

" 在编辑 php 时，要用到 html 的 snippet 补全，临时切换文件类型
"nnoremap fh :setf html<cr>
"nnoremap fp :setf php<cr>

" fh / fp 与 f 行移动冲突
nnoremap ,fh :set ft=html<cr>
nnoremap ,fp :set ft=php<cr>


" 快速编辑 配置文件
"map <leader>e :e! ~/.vimrc<cr>
nnoremap <leader>e :tabnew ~/.vimrc<cr>
" 重载配置文件，立即生效，无须重启
nnoremap <leader>s :source ~/.vimrc<cr>

" 保持 root 权限的文件，Gvwm 要使用 -S 参数，以便读取密码
nnoremap su :w !sudo tee %<cr>

"inoremap <C-c> <ESC>

" Esc 之后 光标位置，不会前移
" inoremap <C-c> <ESC>`^

" 插入模式下使用 Bash emacs 快捷键
" Move 移动
"cnoremap <C-a> <Home>
"cnoremap <C-e> <End>
"cnoremap <C-A> <Home>
"cnoremap <C-E> <End>
"cnoremap <A-b> <S-Left>
"cnoremap <A-f> <S-Right>
"cnoremap <A-B> <S-Left>
"cnoremap <A-F> <S-Right>

" 对包含多行的长段落使用 j/k 移动过度
nnoremap j gj
nnoremap k gk
" C-g 显示文件的完整路径，不能使用 nmap 会发生递归
nnoremap <C-g> 1<C-g>





"}}}

" [ ab ( abbreviate 缩写 ) ]"{{{
""""""""""""""""""""""""""""""""""""""""""""

" >>> 使用 Ctrl - ] 展开，而不是 回车
"norea #r        # [  ]<CR><Esc>44i#<Esc>o<Esc>2kf]
norea #r        # [  ]<CR><Esc>44a-<Esc>o<BS><Esc>2kf]
norea ;r        ; [  ]<CR><Esc>44a-<Esc>o<BS><Esc>2kf]

norea "r        " [  ]<CR><Esc>44i"<Esc>kf]
"norea #r        # [ ]<CR><Esc>44i#<Esc>o<Esc>3k    "可以移动到正确的行首
"norea #r        # [ ]<CR><Esc>44i#<Esc>o<Esc>3kf]  "无法移动到正确的行首
"
norea #v        # vim:set et ft=conf fdm=marker sw=4 sts=4 ts=4 nopaste :<Esc>0f=
norea /v        // vim:set et ft=conf fdm=marker sw=4 sts=4 ts=4 nopaste :<Esc>0f=
norea /*v       /* vim:set et ft=conf fdm=marker sw=4 sts=4 ts=4 nopaste : */<Esc>0f=
"norea #m        #vim:set expandtab filetype= foldmethod=marker nopaste softtabstop=4 shiftwidth=4 tabstop=4 :

norea hphp      header("content-type:text/html;charset=utf8");

" 命令行 缩写，使用于常用目录，可以节省，少打写字，快捷高效
"cnorea tx       ~/me/text/
"cnorea ta       ~/me/text/arch/
"cnorea ts       ~/me/text/soft/
"cnorea tv       ~/me/text/vi.vim/
"cnorea tf       ~/me/text/fvwm/




"}}}

" [ Split 分割 ]"{{{
""""""""""""""""""""""""""""""""""""""""""""

" 同步滚屏 绑定
"set scrollbind

"分割窗口时保持相等的宽/高
set equalalways

""" 上下分割窗口
""" 使窗口隐藏缩放至仅剩状态栏
""set winminheight=0
""" 切换窗口至最大化
""map <C-J> <C-W>j<C-W>_
""map <C-K> <C-W>k<C-W>_


" map => normal,insert,operator-pending

" 分割窗口的切换
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l


""map <C-+> <C-W>+
""map <C--> <C-W>-


"}}}

" [ Buffer 缓冲区 ]"{{{
""""""""""""""""""""""""""""""""""""""""""""
" 缓冲区切换 [前/后]

map  <S-Tab> :bn<CR>
"imap <C-Tab> :bn
map  <C-S-Tab> :bp<CR>
"imap <C-S-Tab> :bp



"}}}

" [ Fold 折叠 ]"{{{
""""""""""""""""""""""""""""""""""""""""""""

set foldmethod=marker

" 用空格键来开关折叠
"nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>

" 不要显示折叠树
"let Tlist_Enable_Fold_Column = 0

""highlight Folded  cterm=bold ctermfg=7
highlight Folded  ctermfg=7

" 空格 开关折叠 / 于翻页切换，Thanks 百合
"function CheckFold()
"  if foldtextresult('.') == ''
"    return "\<C-F>"
"    nmap <Space> za
"  else
"    return 'za'
"  endif
"endfunction
"nmap <expr> <Space> CheckFold()

" [ 特定文件类型折叠 ]"{{{
"""""""""""""""""""""""""""""""""""""""""""""

" Javascript 折叠
"//  vim:fdm=expr:sts=2:foldexpr=getline(v\:lnum)=~'\\v(^(//)?\\s)|(^$)|^\\}$'?1\:'>1'

" 适用于： 火狐 JS 扩展中，很多时候函数和变量都是作为对象的方法和属性的
"// vim:fdm=expr:foldexpr=getline(v\:lnum)=~'\\v^\\s*\\w*\:\\s*|^[a-zA-Z}]|^//\\S'?'>1'\:1

" CSS 折叠
"/* vim: set fdm-marker fmr={,}: */

" C++ 将每个函数折叠：
"// vim:fdm=expr:foldexpr=getline(v\:lnum)=~'^\\S.*{'?'>1'\:1

"使用" --------------------------- 作为分隔线（在块的最后一行）的折叠：
" vim:fdm=expr:fde=getline(v\:lnum-1)=~'\\v"\\s*-{20,}'?'>1'\:1

"}}}


"}}}

" [ autocmd 自动读取 ]"{{{
""""""""""""""""""""""""""""""""""""""""""""

" 获得焦点时不要移动光标
au FocusGained * call getchar(0)

" 跳转 到 上次关闭前 位置 [viminfo 要开启]
"autocmd BufReadPost *
"            \ if line("'\"") > 0 && line ("'\"") <= line("$") |
"            \ exe "normal g'\"" |
"            \ endif

" makefile 里的 Tab 字符具有特殊意义，不允许使用空格代替。*.mak 和 makefile 使用 Tab
" autocmd FileType make set noexpandtab list
autocmd FileType Makefile set noexpandtab

""au FileType python,perl set expandtab
""autocmd FileType c,cpp set shiftwidth=4 | set expandtab
""autocmd FileType python setlocal et | setlocal sta | setlocal sw=4 | setlocal ts=4

" 针对不同的源文件，统一 调试 快捷键
""autocmd! BufNewFile,BufReadPost  *.php nmap < F5 > < ESC >:w< cr >:!clear && php -q < C-R>%< cr >
""autocmd! BufNewFile,BufReadPost  *.cpp nmap < F5 > < ESC >:w< cr >:!clear && g++ < c -R >% -o test && ./test< cr >
""autocmd! BufNewFile,BufReadPost  *.c   nmap < F5 > < ESC >:w< cr >:!clear && gcc < c -R >% -o test && ./test< cr >



"}}}

" [ Function 功能函数 ]"{{{
""""""""""""""""""""""""""""""""""""""""""""

" [ 光标颜色 ]"{{{
"""""""""""""""""""""""""""""""""""""""""""""

" Ubuntu中文论坛：在screen里面动态改变光标颜色
" 第一句  进入 vim时候，光标变成红的
" 第二句  进入插入模式，光标变成蓝色
" 第三句  插入模式结束，光标变回红的
" 第四句  退出 vim之后，光标变成绿色

" 在xterm里的screen里的vim里面
if &term =~ "xterm"
    silent !echo -ne "\e]12;OliveDrab1\007"
    let &t_SI="\e]12;violet\007"
    let &t_EI="\e]12;OliveDrab1\007"
    autocmd VimLeave * :!echo -ne "\e]12;LightSteelBlue\007"

"elseif &term =~ "screen"    " screen in urxvt or xterm
"    :silent !echo -ne "\eP\e]12;IndianRed2\007\e\\"
"    let &t_SI=\eP\e]12;RoyalBlue1\007\e\\"
"    let &t_EI=\eP\e]12;IndianRed2\007\e\\"
"    autocmd VimLeave * :!echo -ne "\eP\e]12;green\007\e\\"

endif


"}}}

" [ 定时执行 ]"{{{
"""""""""""""""""""""""""""""""""""""""""""""
"let s:count= 0
"function! s:TestFunction()
"  echo 'Counting: ' . s:count
"  let s:count= s:count + 1
"  call feedkeys("ma", 't')
"endfunction
"set updatetime=1000    " 1 second
"autocmd! CursorHold *    call s:TestFunction()

"}}}

" [ Tab 智能/自动补全 ]"{{{
"""""""""""""""""""""""""""""""""""""""""""""

"function! CleverTab()
"    if strpart( getline('.'), 0, col('.')-1 ) =~ '^\s*$'
"        return "\<Tab>"
"    else
"        return "\<C-N>"
"endfunction
"inoremap <Tab> <C-R>=CleverTab()<CR>

"Tab 智能补全tags

"fun! KeywordComplete()
"let left = strpart(getline('.'), col('.') - 2, 1)
"if left =~ "^$"
"    return "\<Tab>"
"elseif left =~ ' $'
"    return "\<Tab>"
"else
"    return "\<C-N>"
"endfun
"
"inoremap <silent> <Tab> <C-R>=KeywordComplete()<CR>

"}}}

" [ PHP 字典补全 ]"{{{
"""""""""""""""""""""""""""""""""""""""""""""

" Vim 7.3 支持 PHP 函数补全 C-X C-O
"autocmd FileType php set omnifunc=phpcomplete#CompletePHP

" PHP 函数自动补全，读取的字典文件，仅对php文件启用
" From : http://www.vimer.cn/2010/01/通过vim字典补全，实现php函数名自动补全.html
autocmd FileType php call Phpcmp()
function! Phpcmp()

    "set dictionary-=~/.vim/dictionary/php_funclist.txt dictionary+=~/.vim/dictionary/php_funclist.txt
    "set complete-=k complete +=k

    " Vim 7.3 支持 PHP 函数补全 C-X C-O
    set omnifunc=phpcomplete#CompletePHP

    " 高亮 Baselib 方法
    let php_baselib = 1
    " 引号 内的语句 高亮
    let php_sql_query=1
    " 字符串里的 HTML 语法高亮
    let php_htmlInStrings=1
    " 打开 函数 / class 折叠
    let php_folding=1
    " 在有打开的 ( 和 [ 但没有相应的结束符号的情况下跳过 php 结束标签
    let php_parent_error_open = 1
    " 高亮外层 ] 或 ) 的错误
    let php_parent_error_close = 1

    let g:rainbow=1
    let g:rainbow_brace=1
    let g:rainbow_bracket=1
    let g:rainbow_paren=1

endfunction

"}}}

" [ 导出为 Html ]"{{{
"""""""""""""""""""""""""""""""""""""""""""""
" 转换为 html 格式化 命令
":source $VIMRUNTIME/syntax/2html.vim
":runtime! syntax/2html.vim

" From : http://vim.wikia.com/wiki/Pasting_code_with_syntax_coloring_in_emails
"function MyToHtml(line1,line2)
"    " 使用 css 渲染
"    let html_use_css=1
"    " 对 pre 格式化 空格/换行 为 " "和 br
"    let html_no_pre=1
"    " 使用 xhtml 标准
"    let use_xhtml=1
"    exec a:line1.','.a:line2.'TOhtml'
"endfunction
"" 通过 输入 :MyToHtml 命令来进行转换
"command -range=% MyToHtml :call MyToHtml(<line1>,<line2>)


"}}}

" [ PHP 语法检查 ]"{{{
"""""""""""""""""""""""""""""""""""""""""""""
"
"function! PhpCheckSyntax()
"   " Check php syntax
"   setlocal makeprg=\php\ -l\ -n\ -d\ html_errors=off\ %
"
"   " Set shellpipe
"   setlocal shellpipe=>
"
"   " Use error format for parsing PHP error output
"   setlocal errorformat=%m\ in\ %f\ on\ line\ %l
"   make %
"endfunction
"
"" Perform :PhpCheckSyntax()
"map <F6> :call PhpCheckSyntax()<CR>
"" imap <F6> <ESC>:call PhpCheckSyntax()<CR>
"
"" 文件保存时 自动检查
"autocmd BufWritePost *.php :call PhpCheckSyntax()

"}}}

" [ 在两个不同的 vim 之间复制文本 ]"{{{
"""""""""""""""""""""""""""""""""""""""""""""

""transfer/read and write one block of text between vim sessions
" Usage:
" `from' session:
"     ma
"     move to end-of-block
"     xw
"
" `to' session:
"     move to where I want block inserted
"     xr

"}}}

" [ vim 配置文件位置判断 ]"{{{
"""""""""""""""""""""""""""""""""""""""""""""
"if has("unix")
"    nmap xr   :r $HOME/.vimxfer<CR>
"    nmap xw   :'a,.w! $HOME/.vimxfer<CR>
"    vmap xr   c<esc>:r $HOME/.vimxfer<CR>
"    vmap xw   :w! $HOME/.vimxfer<CR>
"else
"    nmap xr   :r c:/.vimxfer<CR>
"    nmap xw   :'a,.w! c:/.vimxfer<CR>
"    vmap xr   c<esc>:r c:/.vimxfer<cr>
"    vmap xw   :w! c:/.vimxfer<CR>
"endif"

"}}}

" [ 创建 js 文件时自动生成 头注释 ]"{{{
"""""""""""""""""""""""""""""""""""""""""""""
"command -nargs=0 Addreadme :call Addreadme()
"function Addreadme()
"call setline(1,"/**")
"call append(1," * @require : none")
"call append(2," * @author : someone@bluehua.org")
"call append(3," * @date : " . strftime("%Y-%m-%d"))
"call append(4," * @description : this is a new file ")
"call append(5," */")
"endf
":au BufNewFile *.js :Addreadme

"}}}

"}}}

" [ Plugins 插件 ]"{{{
""""""""""""""""""""""""""""""""""""""""""""

" [ Taglist.vim ]"{{{
"""""""""""""""""""""""""""""""""""""""""""""

" 按照名称排序
"let Tlist_Sort_Type = "name"

map <F8> :Tlist<CR>

" 在右侧显示窗口
let Tlist_Use_Right_Window = 1

" 不要关闭其他文件的tags
""let Tlist_File_Fold_Auto_Close = 0
let Tlist_File_Fold_Auto_Close=1 "非当前文件，函数列表折叠隐藏

" 压缩方式
"let Tlist_Compart_Format = 1

" 如果只有一个buffer，kill窗口也kill掉buffer
"let Tlist_Exist_OnlyWindow = 1
" 在环境变量里，可以直接执行
let Tlist_Ctags_Cmd='ctags'

" 同时展示多个文件的函数列表，如果想只有1个，设置为1
let Tlist_Show_One_File=0

" taglist是最后一个分割窗口时，自动退出vim
let Tlist_Exit_OnlyWindow=1

" 非实时更新tags，没有必要
let Tlist_Process_File_Always=0
let Tlist_Inc_Winwidth=0

"}}}

" [ NERD Tree ]"{{{
"""""""""""""""""""""""""""""""""""""""""""""

nnoremap <leader>f :NERDTreeToggle
nnoremap  <F4> :NERDTreeToggle<CR>
imap <F4> <ESC>:NERDTreeToggle<CR>
"nnoremap <A-f> <ESC>:NERDTreeToggle<CR>

" 窗口位置（'left' or 'right'）
let NERDTreeWinPos='left'
" 窗口宽
let NERDTreeWinSize=30
" 指定鼠标模式（1.双击打开；2.单目录双文件；3.单击打开）
let NERDTreeMouseMode=2
" 是否默认显示书签列表
let NERDTreeShowBookmarks=1
" 显示行号
let NERDTreeShowLineNumbers=1
" 高亮显示光标所在行
"let NERDTreeHighlightCursorline=1
" 窗口状态栏
let NERDTreeStatusline=1
" Default: $HOME/.NERDTreeBookmarks
let NERDTreeBookmarksFile=$HOME.'/.vim/NERDBookmarks.txt'

" 让Tree把自己给装饰得多姿多彩漂亮点
"let NERDChristmasTree=1
" 控制当光标移动超过一定距离时，自动将焦点调整到屏中心
"let NERDTreeAutoCenter=1

"NERDTreeSortOrder           排序规则
"NERDTreeCaseSensitiveSort   排序时大小写不敏感 
"NERDTreeBookmarksFile       指定书签文件
"NERDTreeChDirMode           确定是否改变Vim的CWD
"NERDTreeHijackNetrw         是否使用:edit命令时打开NerdTree，替代默认的netrw
"NERDTreeQuitOnOpen          打开文件后是否关闭NerdTree窗口


"}}}

" [ zencoding ]"{{{
"""""""""""""""""""""""""""""""""""""""""""""

"let g:user_zen_expandabbr_key = '<c-y>'
" 可行，但是插入模式不方便
"let g:user_zen_expandabbr_key = ',z'

" 使 zencoding 支持其他语言
let g:user_zen_settings = {
\  'php' : {
\    'extends' : 'html',
\    'filters' : 'c',
\  },
\  'xml' : {
\    'extends' : 'html',
\  },
\  'haml' : {
\    'extends' : 'html',
\  },
\}

"}}}

" [ vimwiki viki ]"{{{
"""""""""""""""""""""""""""""""""""""""""""""
" viki 依赖于 tlib 插件
" From : http://www.gtdstudy.com/?p=1350

"let g:vimwiki_use_mouse = 1
"
""     文件保存时自动输出html，保存大词条比较慢，启用的话就把这一行添加到下面
""     \ 'auto_export': 1,
"let g:vimwiki_list = [{'path': '~/vimwiki/',
"            \ 'path_html': '~/vimwiki/html/',
"            \ 'html_header': '~/vimwiki/template/header.tpl',}]
"
"" From :http://wiki.ktmud.com/tips/vim/vimwiki-guide.html
"" 不需要驼峰英文成为维基词条
"let g:vimwiki_camel_case = 0
"
"" 标记为完成的 checklist 项目颜色
"let g:vimwiki_hl_cb_checked = 1
"
"" vimwiki 菜单项 为空
"let g:vimwiki_menu = ''
"
"" 是否开启按语法折叠，大文件比较慢
""let g:vimwiki_folding = 1
"
"" 是否在计算字串长度时用特别考虑中文字符
"let g:vimwiki_CJK_length = 1
"
"" 详见下文...
"let g:vimwiki_valid_html_tags='b,i,s,u,sub,sup,kbd,del,br,hr,div,code,h1'




"}}}

" [ Buftabs.vim ]
"""""""""""""""""""""""""""""""""""""""""""""

" 仅显示 buffer 对应的文件名，不显示路径
let g:buftabs_only_basename=1

" [ html autoclose ]
"""""""""""""""""""""""""""""""""""""""""""""

" \5 匹配标签对，光标移到标签任意位置即可
" xmledit 插件 -- xml.vim 
" 自动关闭 xhtml 单标签 <br /> <img />
let xml_use_xhtml = 1

" autocmd 使 html_autoclose.vim 作用于xtml,xml文件
" "au FileType xhtml,xml so ~/.vim/ftplugin/html_autoclosetag.vim

" [ autoclose.vim ]
"""""""""""""""""""""""""""""""""""""""""""""

"let g:loaded_AutoClose = 1


" [ matchit.vim ]
"""""""""""""""""""""""""""""""""""""""""""""

" 默认在 /usr/share/vim/vim7/macros/matchit.vim


" [ jquery.vim syntax 插件 ]
"""""""""""""""""""""""""""""""""""""""""""""

"js语法高亮脚本的设置
"let g:javascript_enable_domhtmlcss=1

" 官方
au BufRead,BufNewFile jquery.*.js set ft=javascript syntax=jquery
" vimer.com
"au BufRead,BufNewFile *.js set syntax=jquery




"}}}

"   [ Gvim Gui ]"{{{
""""""""""""""""""""""""""""""""""""""""""""
if(has("gui_running"))

    " Linux   下字体设置
    set guifont=Envy\ Code\ R\ 10

    "窗口位置大小,会使 Tilda 打开无法填满窗口
    set lines=31
    set columns=110

    " 去除光标闪烁
    set gcr=a:blinkon0
    " 去除闪屏
    set novisualbell
    " 完全隐藏工具栏、菜单栏、左右滚动条
    set guioptions-=T
    set guioptions-=m
    set guioptions-=r
    set guioptions-=l

    " 关闭 Alt 激活菜单
    set winaltkeys=no

    " 设置双字节字符所使用的字体--中文
    "set guifontwide=FZXingKai\-S04\ 18
    " Windows 下字体设置
    "set guifont=Envy_Code_R:h10

    "查询相关设置：
    " set options?
    " set guifont?
    "查看更多 Gvim 选项
    "help guioptions


" <F2> 开关 菜单栏 / 工具栏
"noremap <silent> <F2> :if &guioptions =~# 'T' <Bar>
"    \set guioptions-=T <Bar>
"    \set guioptions-=m <bar>
"\else <Bar>
"    \set guioptions+=T <Bar>
"    \set guioptions+=m <Bar>
"    \endif<CR>

endif

"}}}
