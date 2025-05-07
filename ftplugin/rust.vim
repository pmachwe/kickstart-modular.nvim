augroup auto_format_on_save
    autocmd!
    " au BufWritePre *.rs :%! rustfmt
    au BufWritePre <buffer> lua vim.lsp.buf.format()
augroup END
