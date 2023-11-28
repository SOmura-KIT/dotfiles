require('neodev').setup({})

require('lspconfig').lua_ls.setup({
  setting = {
    Lua = {
      completion = {
        callSnippet = 'Replace'
      },
      diagnostics = {
        globals = { 'vim' }
      },
      telemetry = {
        enable = false
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file('', true),
        checkThirdParty = false,
      }
    }
  }
})
