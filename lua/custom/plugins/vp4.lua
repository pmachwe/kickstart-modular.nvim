-- Perforce

return {
    'ngemily/vim-vp4',
    keys = {
        {"<Leader>pp", "<cmd> Vp4", desc = "P4"},
        {"<Leader>pe", "<cmd> Vp4Edit<CR>", desc = "P4 edit"},
        {"<Leader>pa", "<cmd> Vp4Add<CR>", desc = "P4 add"},
        {"<Leader>pr", "<cmd> Vp4Revert<CR>", desc = "P4 revert"},
        {"<Leader>pd", "<cmd> Vp4Describe ", desc = "P4 describe"},
        {"<Leader>pc", "<cmd> Vp4Change", desc = "P4 change"},
        {"<Leader>pi", "<cmd> Vp4Info<cr>", desc = "P4 Info"},
        {"<Leader>po", "<cmd> Vp4 opened<cr>", desc = "P4 opened"},
        {"<Leader>ps", "<cmd> Vp4 sync<cr>", desc = "P4 sync"},
    },
}
