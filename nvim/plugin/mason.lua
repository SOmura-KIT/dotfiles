require('mason').setup({
  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗"
    }
  }
})

-- mason-lspconfig
require('mason-lspconfig').setup_handlers({
  function(server_name)
    require('lspconfig')[server_name].setup{}
  end
})
