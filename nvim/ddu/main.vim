" ui
call ddu#custom#patch_global(#{
      \ ui: 'ff',
      \ uiParams: #{
      \   ff: #{
      \     filterFloatingPosition: 'bottom',
      \     filterSplitDirection: 'floating',
      \     floatingBorder: 'rounded',
      \     previewFloationg: v:true,
      \     previewFloatingBorder: 'rounded',
      \     previewFloatingTitle: 'Preview',
      \     previewSplit: 'horizontal',
      \     prompt: '> ',
      \     split: 'floating',
      \     startFilter: v:true,
      \   }
      \ },
      \ sourceOptions: #{
      \   _: #{
      \     matchers: ['matcher_substring']
      \   },
      \   ignoreCase: v:true
      \ }})

" file recursive
call ddu#custom#patch_local('file_recursive', #{
      \ sources: [#{
      \   name: ['file_rec'],
      \   options: #{
      \     converters: ['converter_devicon']
      \   },
      \   params: #{
      \     ignoredDirectories: ['.git']
      \   },
      \ }],
      \ kindOptions: #{
      \   file: #{
      \     defaultAction: 'open',
      \   },
      \ }})
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
augroup dduFileRecursive
  autocmd!
  autocmd FileType ddu-ff call FileRecursiveKeymaps()
  autocmd FileType ddu-ff-filter call FileRecursiveFilterKeymaps()
augroup END

nnoremap <silent> <C-j>f <Cmd>call ddu#start(#{name: "file_recursive"})<CR>
