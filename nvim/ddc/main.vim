" lsp setting
lua << EOF
require("ddc_nvim_lsp_setup").setup()
require("lspconfig").denols.setup({})
EOF

" ui
call ddc#custom#patch_global(#{
      \ ui: 'pum'
      \ })

" auto complete events
call ddc#custom#patch_global(#{
      \ autoCompleteEvents: [
      \   'InsertEnter',
      \   'TextChangedI',
      \   'TextChangedP',
      \ ]})

" source                                                 nvim           vim
let s:sources = ['skkeleton', 'around'] + (has('nvim') ? ['nvim-lsp'] : [])
call ddc#custom#patch_global(#{
      \   sources: s:sources
      \ })

" source options
call ddc#custom#patch_global(#{
      \ sourceOptions: #{
      \   _: #{
      \     maxItems: 10,
      \     minAutoCompleteLength: 1,
      \     matchers: ['matcher_fuzzy'],
      \     sorters: ['sorter_fuzzy'],
      \     converters: ['converter_fuzzy'],
      \   },
      \   nvim-lsp: #{
      \     mark: '[LSP]',
      \     dup: 'keep',
      \     keywordPattern: '\k+',
      \     sorters: ['sorter_lsp-kind'],
      \   },
      \   skkeleton: #{
      \     mark: '[SKK]',
      \     matchers: ['skkeleton'],
      \     sorters: [],
      \     isVolatile: v:true,
      \   },
      \   around: #{
      \     mark: '[A]'
      \   }
      \ }})
call ddc#custom#set_filetype('vim', #{
      \   sourceOptions: #{ nvim-lsp: #{ mark: '' } }
      \})
call ddc#custom#set_filetype('lua', #{
      \   sourceOptions: #{ nvim-lsp: #{ mark: '' } }
      \})
call ddc#custom#set_filetype('go', #{
      \   sourceOptions: #{ nvim-lsp: #{ mark: '๢' } }
      \})
call ddc#custom#set_filetype('python', #{
      \   sourceOptions: #{ nvim-lsp: #{ mark: '๢' } }
      \})
call ddc#custom#set_filetype('java', #{
      \   sourceOptions: #{ nvim-lsp: #{ mark: '๢' } }
      \})
call ddc#custom#set_filetype('c', #{
      \   sourceOptions: #{ nvim-lsp: #{ mark: '󰍔๢' } }
      \})
call ddc#custom#set_filetype('tex', #{
      \   sourceOptions: #{ nvim-lsp: #{ mark: '๢' } }
      \})
call ddc#custom#set_filetype('dockerfile', #{
      \   sourceOptions: #{ nvim-lsp: #{ mark: '๢' } }
      \})
call ddc#custom#set_filetype('sh', #{
      \   sourceOptions: #{ nvim-lsp: #{ mark: '$๢' } }
      \})
call ddc#custom#set_filetype('zsh', #{
      \   sourceOptions: #{ nvim-lsp: #{ mark: '$๢' } }
      \})

" source params
call ddc#custom#patch_global(#{
      \ sourceParams: #{
      \   nvim-lsp: #{
      \     snippetEngine: denops#callback#register({
      \           body -> vsnip#anonymous(body)
      \     }),
      \     enableResolveItem: v:true,
      \     enableAdditionalTextEdit: v:true,
      \     confirmBehavior: 'replace',
      \   }
      \ }})

call ddc#enable()

" pum setting
inoremap <C-n>   <Cmd>call pum#map#insert_relative(+1)<CR>
inoremap <C-p>   <Cmd>call pum#map#insert_relative(-1)<CR>
inoremap <C-y>   <Cmd>call pum#map#confirm()<CR>
inoremap <C-e>   <Cmd>call pum#map#cancel()<CR>
