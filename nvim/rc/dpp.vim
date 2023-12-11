const s:dpp_base = '~/.cache/dpp'->expand()
call git#use('Shougo/dpp.vim')
call git#use('Shougo/dpp-ext-lazy')
const s:dpp_config = '~/.config/nvim/dpp/config.ts'

if s:dpp_base->dpp#min#load_state()
  call git#use('Shougo/dpp-ext-toml')
  call git#use('Shougo/dpp-ext-installer')
  call git#use('Shougo/dpp-protocol-git')
  call git#use('https://github.com/vim-denops/denops.vim')
  autocmd User DenopsReady call dpp#make_state(s:dpp_base, '<sfile>'->expand()->fnamemodify(':h') .. '/dpp.ts')
endif
