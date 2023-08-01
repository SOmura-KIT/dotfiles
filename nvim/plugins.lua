local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
        PACKER_BOOTSTRAP = fn.system({
                "git",
                "clone",
                "--depth",
                "1",
                "https://github.com/wbthomason/packer.nvim",
                install_path,
        })
        print("Installing packer close and reopen Neovim...")
        vim.cmd([[packadd packer.nvim]])
end

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
        return
end

-- Have packer use a popup window
packer.init({
        display = {
                open_fn = function()
                        return require("packer.util").float({ border = "rounded" })
                end,
        },
})
return packer.startup(function(use)

    -- プラグイン管理
    use({"wbthomason/packer.nvim"})

    -- ライブラリ
    use({"nvim-lua/plenary.nvim"})

    -- ステータスライン
    use({
        "nvim-lualine/lualine.nvim",
        config = function()
            require("plugins/lualine")
        end
    })

    -- bufline
    use({
        "akinsho/bufferline.nvim",
        config = function()
            require("plugins/bufferline")
        end
    })

    -- カラースキーム
    use({
        "EdenEast/nightfox.nvim",
        config = function()
            require("plugins/nightfox")
        end
    })

    -- 補完
    use({
      "cohama/lexima.vim",
      opt = true,
      event = "InsertEnter",
    })

    -- アイコン
    use({"kyazdani42/nvim-web-devicons"})

    -- ポップアップ
    use({
        "rcarriga/nvim-notify",
        config = function()
            require("plugins/notify")
        end
    })

        -- ファジーファインダー
    use({
        "nvim-telescope/telescope.nvim",
        opt = true,
        cmd = "Telescope",
        config = function()
            require("plugins/telescope")
        end,
    })

    -- telescope - ファイルツリー
    use({"nvim-telescope/telescope-file-browser.nvim"})

    -- telescope - Packer
    use({"nvim-telescope/telescope-packer.nvim"})

        -- ハイライト
    use({
        "nvim-treesitter/nvim-treesitter",
        run = {":TSUpdate", ":MasonUpdate"},
        config = function()
            require("plugins/treesitter")
        end
    })

    -- lsp
    use({
        "neovim/nvim-lspconfig",
        config = function()
            require("plugins/nvim-lspconfig")
        end
    })

    -- lsp補助
    use({
        "williamboman/mason.nvim",
        config = function()
            require("plugins/mason")
        end
    })

    use({"williamboman/mason-lspconfig.nvim"})

    -- core
        use({
        "hrsh7th/nvim-cmp",
        config = function()
            require("plugins/cmp")
        end
    })

    -- cmp - LSP
    use({"hrsh7th/cmp-nvim-lsp"})

    -- cmp - コマンドライン
    use({"hrsh7th/cmp-cmdline"})

    -- cmp - パス
    use({"hrsh7th/cmp-path"})

    -- cmp - バッファ内の単語から
    use({"hrsh7th/cmp-buffer"})

    -- cmp - 補完先の詳細(引数など)を表示
    use({"hrsh7th/cmp-nvim-lsp-signature-help"})

    -- cmp - アイコン
    use({"onsails/lspkind.nvim"})

    -- スニペット
    use({
        "L3MON4D3/LuaSnip",
        config = function()
            require("plugins/luasnip")
        end
    })

    -- cmp - LuaSnipと連携
    use({"saadparwaiz1/cmp_luasnip"})

    -- lua 開発補助
    use({
        "folke/neodev.nvim",
        ft = { "lua" },
        config = function()
            require("plugins/neodev")
        end
    })

    -- 色見出し #ffffff
    use({
        "norcalli/nvim-colorizer.lua",
        config = function()
            require("plugins/colorlizer")
        end
    })

    -- github copilot
    use({
      "github/copilot.vim",
      config = function()
        require("plugins/copilot")
      end
    })

    -- コメントショートカット
    use({
        "numToStr/Comment.nvim",
        config = function()
            require("plugins/comment")
        end
    })

    -- Go 開発補助
    use({"fatih/vim-go"})

    -- 起動時間
    use ({
        "dstein64/vim-startuptime",
        cmd = "StartupTime"
    })
end)
