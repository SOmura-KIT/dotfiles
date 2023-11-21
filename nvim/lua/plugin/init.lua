vim.cmd('packadd vim-jetpack')
require('jetpack.packer').startup(function(use) -- bootstrap
  use { 'tani/vim-jetpack' }

  -- plugins
  use { 'vim-jp/vimdoc-ja' }
  use { 'vim-denops/denops.vim' }
  use { 'nvim-tree/nvim-web-devicons' }
  use { 'EdenEast/nightfox.nvim' }
  use { 'neovim/nvim-lspconfig' }
  use { 'williamboman/mason.nvim' }
  use { 'williamboman/mason-lspconfig.nvim' }
  use { 'nvim-treesitter/nvim-treesitter', run=':TSUpdate' }
  use { 'cohama/lexima.vim', event='InsertEnter' }
  use { 'nvim-lualine/lualine.nvim' }
  use { 'lambdalisue/gin.vim' }

  -- lazy
  use {
    'dstein64/vim-startuptime',
    cmd = 'StartupTime'
  }
  use {
    'nvim-tree/nvim-tree.lua',
    cmd = {
      'NvimTreeOpen',
      'NvimTreeToggle',
      'NvimTreeFocus',
      'NvimTreeCollapse',
    },
    config = function()
      require('plugin.lazy.nvim-tree')
    end
  }

  -- ft
  use {
    'fatih/vim-go',
    ft = 'go',
    run = ':GoUpdateBinaries'
  }
  use {
    'folke/neodev.nvim',
    ft = 'lua',
    config = function ()
      require('plugin.lazy.neodev')
    end
  }

  --ddc
  use {
    'Shougo/ddc.vim',
    event = 'InsertEnter',
    config = function()
      require("ddc_nvim_lsp_setup").setup()
      require("lspconfig").denols.setup({})

      vim.cmd('call ddc#custom#load_config(expand("~/.config/nvim/plugin/ddc/main.ts"))')
      vim.fn['ddc#enable']()
    end
  }
  use { 'Shougo/pum.vim', before='ddc.vim' }
  use { 'vim-skk/skkeleton' }
  use { 'hrsh7th/vim-vsnip', before='ddc.vim' }
  use { 'uga-rosa/ddc-nvim-lsp-setup', before='ddc.vim' }
  use { 'Shougo/ddc-ui-pum', before='ddc.vim' }
  use { 'Shougo/ddc-source-nvim-lsp', before='ddc.vim' }
  use { 'Shougo/ddc-source-around', before='ddc.vim' }
  use { 'tani/ddc-fuzzy', before='ddc.vim' }

  -- ddu
  use {
    'Shougo/ddu.vim',
    config = function()
      vim.cmd('source ~/dotfiles/nvim/ddu/main.vim')
    end
  }
  use {
    'Shougo/ddu-ui-ff',
    before = 'ddu.vim'
  }
  use {
    'Shougo/ddu-source-file_rec',
    before = 'ddu.vim'
  }
  use {
    'Shougo/ddu-kind-file',
    before = 'ddu.vim'
  }
  use {
    'Shougo/ddu-filter-matcher_substring',
    before = 'ddu.vim'
  }
end)
