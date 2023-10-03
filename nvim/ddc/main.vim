" lsp setting
lua << EOF
require("ddc_nvim_lsp_setup").setup()
require("lspconfig").denols.setup({})
EOF

" ddc setting
call ddc#custom#patch_global(#{
  \   ui: 'pum',
  \   sources: ['nvim-lsp', 'skkeleton', 'around' ],
  \   autoCompleteEvents: [
  \     'InsertEnter',
  \     'TextChangedI',
  \     'TextChangedP',
  \   ],
  \   sourceOptions: #{
  \     nvim-lsp: #{
  \       mark: '[LSP]',
  \       dup: 'keep',
  \       keywordPattern: '\k+',
  \       sorters: ['sorter_lsp-kind'],
  \     }, 
  \     skkeleton: #{
  \       mark: 'skkeleton',
  \       matchers: ['skkeleton'],
  \       sorters: [],
  \       isVolatile: v:true,
  \     },
  \     around: #{
  \       mark: 'A'
  \     },
  \     _: #{
  \       maxItems: 10,
  \       minAutoCompleteLength: 1,
  \       matchers: ['matcher_fuzzy'],
  \       sorters: ['sorter_fuzzy'],
  \       converters: ['converter_fuzzy'],
  \     }
  \   },
  \   sourceParams: #{
  \     nvim-lsp: #{
  \       snippetEngine: denops#callback#register({
  \             body -> vsnip#anonymous(body)
  \       }),
  \       enableResolveItem: v:true,
  \       enableAdditionalTextEdit: v:true,
  \       confirmBehavior: 'replace',
  \     }
  \   }
\ })

call ddc#enable()

" pum setting
inoremap <C-n>   <Cmd>call pum#map#insert_relative(+1)<CR>
inoremap <C-p>   <Cmd>call pum#map#insert_relative(-1)<CR>
inoremap <C-y>   <Cmd>call pum#map#confirm()<CR>
inoremap <C-e>   <Cmd>call pum#map#cancel()<CR>
