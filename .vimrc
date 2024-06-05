" add yours here  
nnoremap ; :  
inoremap jk <ESC>  
  
" 移动映射  
nnoremap j jzz  
nnoremap k kzz 
inoremap <D-j> <Down>  
inoremap <D-k> <Up>  
inoremap <D-h> <Left>  
inoremap <D-l> <Right>  
nnoremap <D-j> 3<Down>  
nnoremap <D-k> 3<Up>  
nnoremap <D-h> 3<Left>  
nnoremap <D-l> 3<Right>  
  
" force write  
inoremap <D-s> <ESC>:w<CR>  
nnoremap <D-s> <ESC>:w<CR>  
  
" force quit  
nnoremap <D-q> <ESC>:wq!  
  
" clear search  
nnoremap // <ESC>:noh<CR>  
  
" New file  
nnoremap <leader>n :n   
  
" buffer close  
inoremap <D-w> <ESC>:bd<CR>  
nnoremap <D-w> <ESC>:bd<CR>  
  
" new window(tab)  
inoremap <D-n> <ESC>:tabnew<CR>  
nnoremap <D-n> <ESC>:tabnew<CR>  
  
" new buffer  
inoremap <D-t> <ESC>:enew<CR>  
nnoremap <D-t> <ESC>:enew<CR>  
  
" nav buffer  
inoremap <D-]> <ESC>:bNext<CR>  
inoremap <D-[> <ESC>:bprevious<CR>  
nnoremap <D-]> <ESC>:bNext<CR>  
nnoremap <D-[> <ESC>:bprevious<CR>  
  
" nav split  
inoremap <D-}> <ESC><C-w><C-w>  
inoremap <D-{> <ESC><C-w>p  
nnoremap <D-}> <ESC><C-w><C-w>  
nnoremap <D-{> <ESC><C-w>p  
  
" comment  
nnoremap <D-/> :lua require("Comment.api").toggle.linewise.current()<CR>  
vnoremap <D-/> <ESC>:lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>  
  
" nvimtree  
nnoremap <D-e> <cmd>NvimTreeToggle<CR>  
"   
" terminal  
nnoremap <C-`> :lua require("nvchad.term").new { pos = "sp", size = 0.3 }<CR>  
  
" search  
inoremap <D-f> <ESC>/  
nnoremap <D-f> <ESC>/  
  
" undo  
inoremap <D-z> <CMD>:undo<CR>  
inoremap <D-Z> <CMD>:redo<CR>  
nnoremap <D-z> <CMD>:undo<CR>  
nnoremap <D-Z> <CMD>:redo<CR>  
  
" copy and paste  
inoremap <D-v> <ESC>pi  
nnoremap <D-v> <ESC>p  
vnoremap <D-c> y  
  
" select all  
inoremap <D-a> <ESC>ggVG  
nnoremap <D-a> <ESC>ggVG  
  
" bookmark  
nnoremap <D-m> <CMD>lua require'bookmarks'.add_bookmarks(true)<CR>  
  
" Telescope  
nnoremap <D-r> <cmd>Telescope oldfiles<CR>  
  
" Session  
nnoremap <D-R> <cmd>lua require("auto-session.session-lens").search_session()<CR>  
  
" MarkdownPreview  
nnoremap <F8> <ESC>:MarkdownPreview<CR>  
  
" markdown image paste  
nnoremap <c-p> <ESC>:call mdip#MarkdownClipboardImage()<CR><ESC>  
inoremap <c-p> <ESC>:call mdip#MarkdownClipboardImage()<CR><ESC>  
