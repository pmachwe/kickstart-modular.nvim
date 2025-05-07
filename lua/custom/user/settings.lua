-- Basic settings

vim.o.expandtab = true
vim.o.smarttab = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4

vim.o.hidden = true
vim.o.wildmenu = true
vim.o.wildmode = 'list:longest:full'

-- Use both for hybrid
-- Current line shows absolute
vim.o.relativenumber = false
vim.o.number = false

vim.o.hlsearch = true
vim.o.incsearch = true

vim.o.scrolloff = 5

vim.o.showmatch = true

-- Show replace preview in
-- split buffer
vim.o.inccommand = 'split'

-- vim.o.path:append('**')

vim.o.grepprg = 'rg --vimgrep'
vim.o.grepformat = '%f:%l:%c:%m'
