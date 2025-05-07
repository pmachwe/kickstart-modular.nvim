compiler gcc
setlocal makeprg=g++\ --std=c++17\ -o\ %:r\ %

iab uns unsigned
iab umap std::unordered_map<><left>
iab uset std::unordered_set<><left>
iab vec std::vector<><left>
iab ivec std::vector<int>

" Taken from https://aufather.wordpress.com/2010/08/26/omni-completion-in-vim/
set omnifunc=syntaxcomplete#Complete " override built-in C omnicomplete with C++ OmniCppComplete plugin
let OmniCpp_GlobalScopeSearch   = 1
let OmniCpp_DisplayMode         = 1
let OmniCpp_ShowScopeInAbbr     = 0 "do not show namespace in pop-up
let OmniCpp_ShowPrototypeInAbbr = 1 "show prototype in pop-up
let OmniCpp_ShowAccess          = 1 "show access in pop-up
let OmniCpp_SelectFirstItem     = 1 "select first item in pop-up
set completeopt=menuone,menu,longest

nnoremap <buffer> <F4> :call UpdateTags()
nnoremap <buffer> <F5> :make<CR>

" nnoremap <buffer> <leader>cs :call cscope#cscope#Cscope("s", "<C-R><C-W>")<CR>
" nnoremap <buffer> <leader>cg :call cscope#cscope#Cscope("g", "<C-R><C-W>")<CR>
" nnoremap <buffer> <leader>cd :call cscope#cscope#Cscope("d", "<C-R><C-W>")<CR>
" nnoremap <buffer> <leader>cc :call cscope#cscope#Cscope("c", "<C-R><C-W>")<CR>
" nnoremap <buffer> <leader>ct :call cscope#cscope#Cscope("t", "<C-R><C-W>")<CR>
" nnoremap <buffer> <leader>ce :call cscope#cscope#Cscope("e", "<C-R><C-W>")<CR>
" nnoremap <buffer> <leader>cf :call cscope#cscope#Cscope("f", "<C-R><C-W>")<CR>
" nnoremap <buffer> <leader>ci :call cscope#cscope#Cscope("i", "<C-R><C-W>")<CR>
" nnoremap <buffer> <leader>ca :call cscope#cscope#Cscope("a", "<C-R><C-W>")<CR>

if has("cscope")
  nnoremap <buffer> <Leader>cG :CscopeFindGlobal<SPACE>
  nnoremap <buffer> <Leader>cC :CscopeFindCallers<SPACE>
  nnoremap <buffer> <Leader>cF :CscopeFindFile<SPACE>
  nnoremap <buffer> <Leader>cT :CscopeFindTextString<SPACE>
  nnoremap <buffer> <Leader>cS :CscopeFindSymbol<SPACE>

  " Use QuickFix window  for cscope
  :set cscopequickfix=s-,c-,d-,i-,t-,e-,a-
endif

" command! -bang -nargs=* CscopeFindAssignments   call cscope#cscope#Cscope("a", <q-args>)
" command! -bang -nargs=* CscopeFindCallers       call cscope#cscope#Cscope("c", <q-args>)
" command! -bang -nargs=* CscopeFindCalled        call cscope#cscope#Cscope("d", <q-args>)
" command! -bang -nargs=* CscopeFindEgrep         call cscope#cscope#Cscope("e", <q-args>)
" command! -bang -nargs=* CscopeFindFile          call cscope#cscope#Cscope("f", <q-args>)
" command! -bang -nargs=* CscopeFindGlobal        call cscope#cscope#Cscope("g", <q-args>)
" command! -bang -nargs=* CscopeFindInclude       call cscope#cscope#Cscope("i", <q-args>)
" command! -bang -nargs=* CscopeFindSymbol        call cscope#cscope#Cscope("s", <q-args>)
" command! -bang -nargs=* CscopeFindTextString    call cscope#cscope#Cscope("t", <q-args>)

if filereadable(expand('~/.work_machine'))
  " nnoremap <buffer> gr :call cscope#cscope#Cscope("s", "<C-R><C-W>")<CR>
  " nnoremap <buffer> gd :call cscope#cscope#Cscope("g", "<C-R><C-W>")<CR>
  " nnoremap <buffer> K :call ftplugin#c#PreviewTagToggle()<CR>
  " Disable diagnostics with lsp
  " https://github.com/neovim/nvim-lspconfig/issues/662
  lua vim.lsp.handlers["textDocument/publishDiagnostics"] = function() end
endif

" To align function arguments in same column
" namespace without indent
" public/private without indent
setlocal cino+=(0,N-s,g0
