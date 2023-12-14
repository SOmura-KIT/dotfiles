const s:dpp_base = '~/.cache/dpp'->expand()
call git#use('Shougo/dpp.vim')
call git#use('Shougo/dpp-ext-lazy')
"const s:dpp_config = '<sfile>'->expand()->fnamemodify(':h') .. '/dpp.ts'
let $BASE_DIR = '<sfile>'->expand()->fnamemodify(':h')

if s:dpp_base->dpp#min#load_state()
  call git#use('Shougo/dpp-ext-toml')
  call git#use('Shougo/dpp-ext-installer')
  call git#use('Shougo/dpp-protocol-git')
  call git#use('vim-denops/denops.vim')
  autocmd User DenopsReady call dpp#make_state(s:dpp_base, '$BASE_DIR/dpp.ts'->expand())
else
  augroup MyDppCheckFile
    autocmd!
    autocmd BufWritePost *.lua,*.vim,*.toml,*.ts,vimrc,.vimrc
          \ call dpp#check_files()
  augroup END
endif
