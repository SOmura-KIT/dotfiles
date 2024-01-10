" hook_add {{{
function! FileRecursiveKeymaps() abort
  nnoremap <buffer> <silent> q <Cmd>call ddu#ui#ff#do_action('quit')<CR>
  nnoremap <buffer> <silent> <Esc> <Cmd>call ddu#ui#ff#do_action('quit')<CR>
  nnoremap <buffer> <silent> <C-[> <Cmd>call ddu#ui#ff#do_action('quit')<CR>
  nnoremap <buffer> <silent> <CR> <Cmd>call ddu#ui#ff#do_action('itemAction')<CR>
  nnoremap <buffer> <silent> f <Cmd>call ddu#ui#ff#do_action('openFilterWindow')<CR>
  nnoremap <buffer> <silent> p <Cmd>call ddu#ui#ff#do_action('togglePreview')<CR>
endfunction

function! FileRecursiveFilterKeymaps() abort
  nnoremap <buffer> <silent> <CR> <Cmd>close<CR>
  inoremap <buffer> <silent> <CR> <Esc><Cmd>close<CR>
  inoremap <buffer> <silent> <Esc> <Esc><Cmd>close<CR>
  inoremap <buffer> <silent> <C-[> <Esc><Cmd>close<CR>
endfunction

augroup DduFileRecursive
  autocmd!
  autocmd FileType ddu-ff call FileRecursiveKeymaps()
  autocmd FileType ddu-ff-filter call FileRecursiveFilterKeymaps()
augroup END

nnoremap <Space>f <Cmd>call ddu#start(#{name:"file_recursive"})<CR>
" }}}

" hook_source {{{
call ddu#custom#load_config('$BASE_DIR/ddu.ts'->expand())
" }}}
