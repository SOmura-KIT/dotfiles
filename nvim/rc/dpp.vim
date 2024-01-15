const g:dpp_base = '~/.cache/dpp'->expand()
call git#use('Shougo/dpp.vim')
call git#use('Shougo/dpp-ext-lazy')
let $BASE_DIR = '<sfile>'->expand()->fnamemodify(':h')

if g:dpp_base->dpp#min#load_state()
  call git#use('Shougo/dpp-ext-toml')
  call git#use('Shougo/dpp-ext-installer')
  call git#use('Shougo/dpp-protocol-git')
  call git#use('vim-denops/denops.vim')
  autocmd User DenopsReady call dpp#make_state(g:dpp_base, '$BASE_DIR/dpp.ts'->expand()) |
          \ echomsg 'dpp made state'
else
  augroup MyDppCheckFile
    autocmd!
    autocmd BufWritePost *.lua,*.vim,*.toml,*.ts,vimrc,.vimrc
          \ call dpp#check_files()
  augroup END
endif
