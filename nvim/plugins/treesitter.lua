require'nvim-treesitter.configs'.setup {
	highlight = {
        enable = true,	-- syntax highlightを有効にする
        disable = {
            "html",
            "markdown",
            "tex",
            "latex",
            "php"
        },
        additional_vim_regix_highlighting = false,
	},
}
