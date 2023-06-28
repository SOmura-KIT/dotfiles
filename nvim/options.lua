local GLOBAL_OPTIONS = {
    autoindent = false,
    autoread = true,        -- Vimの使用中に外部から変更された場合に適応
    backup = false,         -- 起動時にめんどくさいからOFF
    cursorcolumn = true,
    cursorline = true,
    expandtab = true,
    hlsearch = true,
    mouse = "",
    number = true,
    relativenumber = true,
    ruler = true,
    shiftwidth = 4,
    showcmd = true,
    signcolumn = "yes",
    splitright = true,
    tabstop = 4,
    termguicolors = true,
    updatetime = 300,
    wrap = true,
    writebackup = false,
    foldmethod = "expr",
}

local LANGUAGE_OPTIONS = {
    css = {
        shiftwidth = 2,
        tabstop = 2,
    },

    go = {
        expandtab = false,
    },

    html = {
        shiftwidth = 2,
        tabstop = 2,
    },

    javascript = {
        shiftwidth = 2,
        tabstop = 2,
    },

    lua = {
        shiftwidth = 2,
        tabstop = 2,
    },

    scss = {
        shiftwidth = 2,
        tabstop = 2,
    },

    tex = {
        shiftwidth = 2,
        tabstop = 2,
    },

    typescript = {
        shiftwidth = 2,
        tabstop = 2,
    },
}

local setOptionsByTable = function(options)
    for optionName, value in pairs(options) do
        vim.opt[optionName] = value
    end
end

local getValueOrBrankTableFromTable = function(tableObj, key)
    if HasKey(tableObj, key) then
        return tableObj[key]
    end
    return {}
end

local setGlobalOptions = function()
    local globalOptions = CopyTable(GLOBAL_OPTIONS)
    setOptionsByTable(globalOptions)
end

local setLanguageOptions = function()
    local bufferFiletype = vim.o["filetype"]
    local targetLanguageOptions = getValueOrBrankTableFromTable(LANGUAGE_OPTIONS, bufferFiletype)
    setOptionsByTable(targetLanguageOptions)
end

vim.api.nvim_create_autocmd({ "FileType", "TabEnter" }, {
    pattern = {"*"},
    callback = function()
        setGlobalOptions()
        setLanguageOptions()
    end,
})

vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
-- 起動時処理
setGlobalOptions()
