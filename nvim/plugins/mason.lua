require("mason").setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})

require("mason-lspconfig").setup_handlers({ function(server)
  local opt = {
    capabilities = require("cmp_nvim_lsp").default_capabilities()
  }
  require('lspconfig')[server].setup(opt)
end })
