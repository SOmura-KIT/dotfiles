set nocompatible

const s:dpp_base = '~/.cache/dpp/'
call g:git#use('https://github.com/Shougo/dpp.vim')
const s:dpp_config = '~/.config/nvim/dpp/config.ts'

if dpp#min#load_state(s:dpp_base)
  call g:git#use('https://github.com/vim-denops/denops.vim')
  autocmd User DenopsReady call dpp#make_state(s:dpp_base, s:dpp_config)
endif

"-----
" オプション
source ~/.config/nvim/options.vim
