" hook_add {{{
function! DduViewKeymaps() abort
  nnoremap <buffer> <silent> q <Cmd>call ddu#ui#do_action('quit')<CR>
  nnoremap <buffer> <silent> <Esc> <Cmd>call ddu#ui#do_action('quit')<CR>
  nnoremap <buffer> <silent> <C-[> <Cmd>call ddu#ui#do_action('quit')<CR>
  nnoremap <buffer> <silent> <CR> <Cmd>call ddu#ui#do_action('itemAction')<CR>
  nnoremap <buffer> <silent> f <Cmd>call ddu#ui#do_action('openFilterWindow')<CR>
  nnoremap <buffer> <silent> p <Cmd>call ddu#ui#do_action('togglePreview')<CR>
endfunction

function! DduFilterKeymaps() abort
  nnoremap <buffer> <silent> <CR> <Cmd>close<CR>
  inoremap <buffer> <silent> <CR> <Esc><Cmd>close<CR>
  inoremap <buffer> <silent> <Esc> <Esc><Cmd>close<CR>
  inoremap <buffer> <silent> <C-[> <Esc><Cmd>close<CR>
endfunction

augroup DduKeymaps
  autocmd!
  autocmd FileType ddu-ff call DduViewKeymaps()
  autocmd FileType ddu-ff-filter call DduFilterKeymaps()
augroup END

nnoremap <Space>F <Cmd>call ddu#start(#{name:"file"})<CR>
nnoremap <Space>f <Cmd>call ddu#start(#{name:"file_recursive"})<CR>
nnoremap <Space>h <Cmd>call ddu#start(#{name:"help"})<CR>
nnoremap <Space>r <Cmd>call ddu#start(#{name:"ripgrep"})<CR>
nnoremap <Space>b <Cmd>call ddu#start(#{name:"buffer"})<CR>
" }}}

" hook_source {{{
call ddu#custom#load_config('$BASE_DIR/ddu.ts'->expand())
" }}}
