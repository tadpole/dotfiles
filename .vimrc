set nocompatible              " required
filetype off                  " required


filetype plugin indent on
set softtabstop=4
set tabstop=4
set shiftwidth=4
set expandtab

set number
set hlsearch
set encoding=utf-8
set mouse=a
set dictionary+=/usr/share/dict/words
filetype plugin on

ia xdate <c-r>=strftime("%Y/%m/%d %H:%M:%S")<cr>
ia uns using namespace std;
ia makec++ //<c-r>=expand("%")<cr><lf><c-r>=strftime("%Y-%m-%d %H:%M:%S")<cr><lf><c-r>=$USER<cr><lf><backspace><backspace><lf>#include <iostream><lf>using namespace std;<lf>int main(int argc, char** argv)<lf>{<lf><tab><lf>return 0;<lf><backspace>}<lf>
"autocmd BufNewFile *.cpp 0r ~/test.cpp
ia usaco /*<lf><backspace><backspace><backspace>ID: tuke1991<lf>PROG: <lf>LANG: C++<lf>*/<lf>#include <iostream><lf>#include <fstream><lf>using namespace std;<lf>int main(int argc, char** argv)<lf>{<lf><tab><lf>return 0;<lf><backspace>}<lf>

set ruler
set showcmd
set list lcs=tab:☞-,trail:♪
autocmd Filetype c set omnifunc=ccomplete
autocmd Filetype cpp set omnifunc=cppcomplete


set foldmethod=indent
set foldlevel=99
"Enable folding with the spacebar
nnoremap <space> za

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
	elseif &filetype == 'sh'
		:!time bash %
	elseif &filetype == 'python'
		exec "!python3 %"
	endif
endfunc
