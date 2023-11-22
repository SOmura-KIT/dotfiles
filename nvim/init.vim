set nocompatible

const s:dpp_base = '~/.cache/dpp/'
if !exists('g:dpp#_name')
  const s:dpp_src = '~/.cache/dpp/repos/github.com/Shougo/dpp.vim'
  execute 'set runtimepath^=' .. s:dpp_src
  echo 'hello'
endif
const s:dpp_config = '~/.config/nvim/dpp.ts'
const s:denops_src = '~/.cache/dpp/repos/github.com/vim-denops/denops.vim'

if dpp#min#load_state(s:dpp_base)
  execute 'set runtimepath^=' .. s:denops_src
  autocmd User DenopsReady call dpp#make_state(s:dpp_base, s:dpp_config)
endif

"-----
" オプション
source ~/.config/nvim/options.vim
" help日本語化
"const s:vimdoc_ja_src = '~/.cache/dpp/repos/github.com/vim-jp/vimdoc-ja'
"execute 'set runtimepath+=' .. s:vimdoc_ja_src
