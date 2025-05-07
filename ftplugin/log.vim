" Disable nvim-comp for log files which could be large
" and usually do not need any editing.

lua require('cmp').setup.buffer { enabled = false }
:IlluminatePauseBuf

setlocal noswf bh=unload
setlocal ul=-1
setlocal syntax=off
set noincsearch

augroup MyNvimCmp
  autocmd!
augroup END
