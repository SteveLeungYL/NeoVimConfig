require'lspconfig'.pyright.setup{on_attach=require'completion'.on_attach}
require'lspconfig'.clangd.setup{on_attach=require'completion'.on_attach}
require("symbols-outline").setup()
