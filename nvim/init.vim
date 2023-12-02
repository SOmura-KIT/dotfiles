set nocompatible

const s:dpp_base = '~/.cache/dpp'
call g:git#use('https://github.com/Shougo/dpp.vim')
call g:git#use('https://github.com/Shougo/dpp-ext-toml')
call g:git#use('https://github.com/Shougo/dpp-ext-lazy')
call g:git#use('https://github.com/Shougo/dpp-ext-installer')
call g:git#use('https://github.com/Shougo/dpp-protocol-git')
const s:dpp_config = '~/.config/nvim/dpp/config.ts'

if dpp#min#load_state(s:dpp_base)
  call g:git#use('https://github.com/vim-denops/denops.vim')
  autocmd User DenopsReady call dpp#make_state(s:dpp_base, s:dpp_config)
endif

"--------------------
source ~/.config/nvim/rc/init.vim
