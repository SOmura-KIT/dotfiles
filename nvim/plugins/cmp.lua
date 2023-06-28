vim.api.nvim_command('set completeopt=menu,menuone,noselect')

local cmp = require("cmp")
local lspkind = require("lspkind")
local luasnip = require("luasnip")

local has_words_before = function()
    unpack = unpack or table.unpack
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

cmp.setup({
    snippet = {
        -- REQUIRED - you must specify a snippet engine
        expand = function(args)
            require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        end,
    },

    window = {

    },

    mapping = cmp.mapping.preset.insert({
        -- 下
        ["<C-p>"] = cmp.mapping.select_prev_item(),
        -- 上
        ["<C-n>"] = cmp.mapping.select_next_item(),
        -- キャンセル
        ['<C-e>'] = cmp.mapping.abort(),
        -- 確定
        ['<C-y>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        -- 次の入力位置
        ["<Tab>"] = cmp.mapping(function(fallback)
            if luasnip.jumpable(1) then
                luasnip.jump(1)
            else
                fallback()
            end
        end, { "i", "s" }),
        -- 前の入力位置
        ["<S-Tab>"] = cmp.mapping(function(fallback)
            if luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, { "i", "s" }),
    }),

    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
        { name = "nvim_lsp_signature_help" },
        { name = "treesitter"},
    }, {
        { name = 'buffer' },
    }),

    formatting = {
        format = lspkind.cmp_format({
            mode = 'symbol',
            maxwidth = 50,
            ellipsis_char = '…',
        })
    },
})

cmp.setup.filetype('gitcommit', {
    source = cmp.config.sources({
        { name = 'cmp_git' },
    }, {
        { name = 'buffer' }
    })
})

cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    source = {
        { name = 'buffer' }
    }
})

cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
        { name = 'path' }
    }, {
        { name = 'cmdline' }
    })
})

-- cmp-lsp
local capabilities = vim.lsp.protocol.make_client_capabilities()
