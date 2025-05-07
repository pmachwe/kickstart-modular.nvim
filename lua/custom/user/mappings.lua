-- Basic mappings

local map = function(mode, lhs, rhs, desc, opts)
  opts = opts or {}
  opts.desc = desc
  vim.keymap.set(mode, lhs, rhs, opts)
end

local L = function(key)
  return '<leader>' .. key
end
local C = function(cmd)
  return '<Cmd>' .. cmd .. '<CR>'
end

map('n', L 'qq', ':qa<CR>', 'Quit')
-- map("n", L"w", "<c-w>", "Windows")
-- map("n", L"wv", "<c-w>v", "Split Vertically Windows")

-- local wk = require 'which-key'

-- wk.add {
--   { '<Leader>f', group = 'File' },
--   -- { "<Leader>ff", "<cmd>Telescope find_files<CR>", desc = "Find files", mode = "n" },
--   { '<Leader>c', group = 'Cscope' },
--   { '<Leader>p', group = 'Perforce' },
--   { '<Leader>s', group = 'Search' },
-- }
--
local opts = { noremap = true, silent = true }

if vim.g.vscode then
  -- VSCode extension
  -- Use <Space> as leader in VSCode
  --     xnoremap = <Cmd>lua require('vscode').call('editor.action.formatSelection')<CR>
  -- nnoremap = <Cmd>lua require('vscode').call('editor.action.formatSelection')<CR><Esc>
  -- nnoremap == <Cmd>lua require('vscode').call('editor.action.formatSelection')<CR>
  vim.api.nvim_set_keymap(
    'n',
    '?',
    "<Cmd>lua require('vscode').action('workbench.action.findInFiles', { args = { query = vim.fn.expand('<cword>') } })<CR>",
    opts
  )
  -- vim.api.nvim_set_keymap('n', '<Space>m', "<Cmd>lua require('vscode').action('workbench.action.toggleMaximizedPanel')<CR>", opts)
  -- vim.api.nvim_set_keymap('n', '/', "<Cmd>lua require('vscode').action.find<CR>", opts)
else
  -- vim.g.mapleader = ','
  -- ordinary Neovim
  vim.api.nvim_set_keymap('i', 'jj', '<Esc>', opts)
  vim.api.nvim_set_keymap('n', '<Leader>w', ':update<CR>', opts)
  -- These 2 cause editor to pause after , in insert mode
  -- vim.api.nvim_set_keymap('i', '<Leader>w', '<Esc>:update<CR>', opts)
  -- vim.api.nvim_set_keymap('i', '<Leader>z', '<Esc>', opts)
  vim.api.nvim_set_keymap('n', '<Leader>q', ':quit<CR>', opts)
  -- vim.api.nvim_set_keymap('n', '<Leader><Leader>s', ':source %<CR>', opts)
  -- vim.api.nvim_set_keymap('n', '<Leader><Leader>i', ':edit ~/.config/nvim/init.lua<CR>', opts)

  vim.api.nvim_set_keymap('n', '<Leader><Leader>', ':b#<CR>', opts)
  vim.api.nvim_set_keymap('n', '<Leader>k', ':bd<CR>', opts)
  vim.api.nvim_set_keymap('n', '<Leader>o', ':only<CR>', opts)

  vim.api.nvim_set_keymap('n', 'U', '<C-u>', opts)
  vim.api.nvim_set_keymap('n', 'D', '<C-d>', opts)

  vim.api.nvim_set_keymap('', '<A-l>', '<C-w>l', opts)
  vim.api.nvim_set_keymap('', '<A-k>', '<C-w>k', opts)
  vim.api.nvim_set_keymap('', '<A-j>', '<C-w>j', opts)
  vim.api.nvim_set_keymap('', '<A-h>', '<C-w>h', opts)

  -- Quickfix
  vim.api.nvim_set_keymap('n', '<leader>qo', ':copen<CR>', opts)
  vim.api.nvim_set_keymap('n', '<leader>qc', ':cclose<CR>', opts)
  vim.api.nvim_set_keymap('n', '<leader>qn', ':cnext<CR>', opts)
  vim.api.nvim_set_keymap('n', '<leader>qp', ':cprevious<CR>', opts)
  vim.api.nvim_set_keymap('n', '<leader>ql', ':clast<CR>', opts)
  vim.api.nvim_set_keymap('n', '<leader>qf', ':cfirst<CR>', opts)
  vim.api.nvim_set_keymap('n', '<leader>qh', ':chistory<CR>', opts)
  vim.api.nvim_set_keymap('n', '<A-n>', ':cnext<CR>', opts)
  vim.api.nvim_set_keymap('n', '<A-p>', ':cprevious<CR>', opts)

  -- ToggleTerm
  vim.api.nvim_set_keymap('n', '\\t', ':ToggleTerm<CR>', opts)
  vim.api.nvim_set_keymap('t', '<C-\\><C-n>\\t', ':ToggleTerm<CR>', opts)
  vim.api.nvim_set_keymap('t', '<Esc>', '<C-\\><C-n>', opts)

  -- Paste and indent
  vim.api.nvim_set_keymap('n', 'p', 'p=`]', opts)

  -- Move between buffers (inspired by Lazyvim)
  vim.api.nvim_set_keymap('n', 'H', ':bnext<CR>', opts)
  vim.api.nvim_set_keymap('n', 'L', ':bprevious<CR>', opts)
end
