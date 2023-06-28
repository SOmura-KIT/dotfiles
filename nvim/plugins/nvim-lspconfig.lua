local lspconfig = require("lspconfig")

lspconfig.lua_ls.setup {
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" }
      },
      telemetry = {
        enable = false,
      },
      completion = {
        callSnippet = "Replace",
      },
      workspace = {
          library = vim.api.nvim_get_runtime_file('', true),
          checkThirdParty = false,
      }
    }
  }
}
