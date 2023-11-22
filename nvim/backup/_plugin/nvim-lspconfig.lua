-- keymaps
local keymap = vim.keymap.set
local LSP = '<C-l>'
keymap('n', LSP..'e', vim.diagnostic.open_float)
keymap('n', LSP..'<C-p>', vim.diagnostic.goto_prev)
keymap('n', LSP..'<C-n>', vim.diagnostic.goto_next)
keymap('n', LSP..'q', vim.diagnostic.setloclist)

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    local opts = { buffer = ev.buf }
    keymap('n', LSP..'D', vim.lsp.buf.declaration, opts)
    keymap('n', LSP..'d', vim.lsp.buf.definition, opts)
    keymap('n', LSP..'h', vim.lsp.buf.hover, opts)
    keymap('n', LSP..'i', vim.lsp.buf.implementation, opts)
    keymap('n', LSP..'s', vim.lsp.buf.signature_help, opts)
    keymap('n', LSP..'wa', vim.lsp.buf.add_workspace_folder, opts)
    keymap('n', LSP..'wr', vim.lsp.buf.remove_workspace_folder, opts)
    keymap('n', LSP..'wl', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts)
    keymap('n', LSP..'t', vim.lsp.buf.type_definition, opts)
    keymap('n', LSP..'n', vim.lsp.buf.rename, opts)
    keymap({ 'n', 'v' }, LSP..'a', vim.lsp.buf.code_action, opts)
    keymap('n', LSP..'r', vim.lsp.buf.references, opts)
    keymap('n', LSP..'f', function()
      vim.lsp.buf.format { async = true }
    end, opts)
  end,
})

-- configs
local lspconfig = require('lspconfig')

lspconfig.lua_ls.setup({})

lspconfig.vimls.setup({})

lspconfig.gopls.setup({})

lspconfig.denols.setup({})

lspconfig.clangd.setup({})

lspconfig.pyright.setup({})

lspconfig.texlab.setup({})
