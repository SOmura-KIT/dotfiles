vim.cmd('packadd vim-jetpack')
require('jetpack.packer').startup(function(use) -- bootstrap
  use { 'tani/vim-jetpack' }

  -- plugins
  use {
    'vim-denops/denops.vim',
    dir = '~/.config/nvim/denops.vim'
  }
  use { 'nvim-tree/nvim-web-devicons' }
  use { 'EdenEast/nightfox.nvim' }
  use { 'neovim/nvim-lspconfig' }
  use { 'williamboman/mason.nvim' }
  use { 'williamboman/mason-lspconfig.nvim' }
  use {
    'folke/neodev.nvim',
    ft = 'lua',
    config = function ()
      require('plugin.lazy.neodev')
    end
  }
  use { 'nvim-treesitter/nvim-treesitter', run=':TSUpdate' }
  use { 'cohama/lexima.vim', event='InsertEnter' }
  use { 'nvim-lualine/lualine.nvim' }

  -- lazy
  use { 'dstein64/vim-startuptime', cmd='StartupTime' }
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
  use { 'fatih/vim-go', ft='go', run=':GoUpdateBinaries' }

  --ddc
  use {
    'Shougo/ddc.vim',
    event = 'InsertEnter',
    config = function()
      vim.cmd('source ~/dotfiles/nvim/ddc/main.vim')
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
      vim.cmd[[
        call ddu#custom#patch_global({
          \   'ui': 'ff',
          \   'sources': [
          \     {'name':'file','params':{}}
          \   ],
          \   'sourceOptions': {
          \     '_': {
          \       'matchers': ['matcher_substring'],
          \     },
          \   },
          \   'kindOptions': {
          \     'file': {
          \       'defaultAction': 'open',
          \     },
          \   },
          \ })
      ]]
    end
  }
  use {
    'Shougo/ddu-ui-ff',
    before = 'ddu.vim'
  }
  use {
    'Shougo/ddu-source-file',
    before = 'ddu.vim'
  }
  use {
    'Shougo/ddu-filter-matcher_substring',
    before = 'ddu.vim'
  }
end)
