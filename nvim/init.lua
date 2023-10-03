-- 組み込みプラグインの無効化
vim.g['loaded_gzip'] = true
vim.g['loaded_tar'] = true
vim.g['loaded_tarPlugin'] = true
vim.g['loaded_zip'] = true
vim.g['loaded_zipPlugin'] = true
vim.g['loaded_rrhelper'] = true
vim.g['loaded_2html_plugin'] = true
vim.g['loaded_vimball'] = true
vim.g['loaded_vimballPlugin'] = true
vim.g['loaded_getscript'] = true
vim.g['loaded_getscriptPlugin'] = true
vim.g['loaded_logipat'] = true
vim.g['loaded_matchparen'] = true
vim.g['loaded_man'] = true
vim.g['loaded_netrw'] = true
vim.g['loaded_netrwPlugin'] = true
vim.g['loaded_netrwSettings'] = true
vim.g['loaded_netrwFileHandlers'] = true
-- プラグイン読み込み
require('plugin')

-- オプションのリスト
local opts = {
  autoindent     = false,
  autoread       = true,
  backup         = false,
  cursorcolumn   = true,
  cursorline     = true,
  expandtab      = true,
  hlsearch       = true,
  mouse          = '',
  number         = true,
  relativenumber = true,
  ruler          = true,
  shiftwidth     = 2,
  showcmd        = true,
  splitright     = true,
  tabstop        = 2,
  updatetime     = 300,
  wrap           = true,
  writebackup    = true,
}

-- オプションの設定
local setOpt = vim.api.nvim_set_option_value
for opt_name, opt_arg in pairs(opts) do
  setOpt(opt_name, opt_arg, {})
end

-- キーバインド
local keymap = vim.keymap.set

keymap({ 'n' }, '<Space>ww', ':w<CR>', { noremap=true })
keymap({ 'n' }, '<Space>qq', ':q<CR>', { noremap=true })
keymap({ 'n' }, '<Space>wq', ':wq<CR>',{ noremap=true })
keymap({ 'n', 'v' }, 'j', 'gj', { noremap=true })
keymap({ 'n', 'v' }, 'k', 'gk', { noremap=true })
keymap({ 'n', 'v' }, 'gj', 'j', { noremap=true })
keymap({ 'n', 'v' }, 'gk', 'k', { noremap=true })
keymap({ 'i', 'c' }, '<C-D>', '<Del>', { noremap=true })
keymap({ 'i', 'c' }, '<C-B>', '<Left>',  { noremap=true })
keymap({ 'i', 'c' }, '<C-F>', '<Right>', { noremap=true })
keymap({ 'n', 'c' }, '<ESC>', '<C-C>', { noremap=true })
keymap({ 'n', 'c' }, '<C-[>', '<C-C>', { noremap=true })
keymap({ 'c' }, '<C-A>', '<HOME>', { noremap=true })
keymap({ 'c' }, '<C-E>', '<END>', { noremap=true })

-- autocmd
local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

autocmd('insertLeave', {
  group = augroup('autoDisableIME', { clear=true }),
  pattern = '*',
  command = 'silent! :!fcitx5-remote -c'
})

-- カラースキーム
vim.cmd[[ colorscheme carbonfox ]]
