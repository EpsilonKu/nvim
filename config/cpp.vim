autocmd filetype cpp map <F5> :cd %:p:h<CR>:w <bar> !g++ -std=c++17 -O2 -Wall % -o %:r<CR> 
autocmd filetype cpp map <F6> :cd %:p:h<CR>:w <bar> :FloatermNew --height=0.7 --width=0.7 --wintype=floating --name=Application --autoclose=0 g++ -std=c++17 -O2 -Wall % -o %:r && ./%:r<CR>
