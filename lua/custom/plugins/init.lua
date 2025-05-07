return {
  'tpope/vim-dispatch', -- Async
  'junegunn/vim-peekaboo', -- Registers
  'tpope/vim-scriptease', -- :Message

  {
    'christoomey/vim-tmux-navigator',
    lazy = false,
    keys = {
      { '<A-h>', ':TmuxNavigateLeft<CR>', desc = 'Tmux Left' },
      { '<A-j>', ':TmuxNavigateDown<CR>', desc = 'Tmux Down' },
      { '<A-k>', ':TmuxNavigateUp<CR>', desc = 'Tmux Up' },
      { '<A-l>', ':TmuxNavigateRight<CR>', desc = 'Tmux Right' },
      { '<A-\\>', ':TmuxNavigatePrevious<CR>', desc = 'Tmux Previous' },
    },
  },

  {
    'ethanholz/nvim-lastplace',
    config = function()
      require('nvim-lastplace').setup {
        lastplace_ignore_buftype = { 'quickfix', 'nofile', 'help' },
        lastplace_ignore_filetype = { 'gitcommit', 'gitrebase', 'svn', 'hgcommit' },
        lastplace_open_folds = true,
      }
    end,
  },

  -- use this instead of leap.nvim
  {
    'folke/flash.nvim',
    event = 'VeryLazy',
    ---@type Flash.Config
    opts = {},
        -- stylua: ignore
        keys = {
            { "s", mode = { "n", "o", "x" }, function() require("flash").jump() end, desc = "Flash" },
            { "S", mode = { "n", "o", "x" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
            { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
            { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
            { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
        },
  },

  -- Highlight word under curson
  -- "RRethy/vim-illuminate",

  -- Writable file explorer
  {
    'stevearc/oil.nvim',
    opts = {},
    -- Optional dependencies
    -- dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require('oil').setup()
    end,
  },

  -- Emacs imenu type of view
  {
    'stevearc/aerial.nvim',
    opts = {},
    -- Optional dependencies
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
      -- "nvim-tree/nvim-web-devicons"
    },
    config = function()
      require('aerial').setup {
        -- optionally use on_attach to set keymaps when aerial has attached to a buffer
        on_attach = function(bufnr)
          -- Jump forwards/backwards with '{' and '}'
          vim.keymap.set('n', '{', '<cmd>AerialPrev<CR>', { buffer = bufnr })
          vim.keymap.set('n', '}', '<cmd>AerialNext<CR>', { buffer = bufnr })
        end,
      }
      -- You probably also want to set a keymap to toggle aerial
      vim.keymap.set('n', '<leader>a', '<cmd>AerialToggle!<CR>')
    end,
  },

  {
    'Exafunction/codeium.vim',
    event = 'BufEnter',
    config = function()
      -- Change '<C-g>' here to any keycode you like.
      vim.keymap.set('i', '<C-f>', function()
        return vim.fn['codeium#Accept']()
      end, { expr = true, silent = true })
      vim.keymap.set('i', '<tab>', function()
        return vim.fn['codeium#Accept']()
      end, { expr = true, silent = true })
      vim.keymap.set('i', '<c-;>', function()
        return vim.fn['codeium#CycleCompletions'](1)
      end, { expr = true, silent = true })
      vim.keymap.set('i', '<c-,>', function()
        return vim.fn['codeium#CycleCompletions'](-1)
      end, { expr = true, silent = true })
      vim.keymap.set('i', '<c-x>', function()
        return vim.fn['codeium#Clear']()
      end, { expr = true, silent = true })
    end,
  },

  {
    'leath-dub/snipe.nvim',
    keys = {
      {
        'gb',
        function()
          require('snipe').open_buffer_menu()
        end,
        desc = 'Open Snipe buffer menu',
      },
      {
        '<Leader>b',
        function()
          require('snipe').open_buffer_menu()
        end,
        desc = 'Open Snipe buffer menu',
      },
    },
    opts = {},
  },

  {
    'NeogitOrg/neogit',
    cmd = 'Neogit',
    keys = {
      { '<f6>', '<cmd>Neogit<CR>', desc = 'Open Neogit interface for Git operations' },
    },
    dependencies = {
      'nvim-lua/plenary.nvim', -- required
      'nvim-telescope/telescope.nvim', -- optional
      'sindrets/diffview.nvim', -- optional
      'ibhagwan/fzf-lua', -- optional
    },
    config = true,
  },
}
