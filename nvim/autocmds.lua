local augroup = vim.api.nvim_create_augroup -- Create/get autocommand group
local autocmd = vim.api.nvim_create_autocmd -- Create autocommand

-- Remove whitespace on save
autocmd("BufWritePre", {
    group = augroup("RemveTailWhitespace", {}),
	pattern = "*",
	command = ":%s/\\s\\+$//e",
})

-- Don't auto commenting new lines
autocmd("BufEnter", {
    group = augroup("DisableAutoComent", {}),
	pattern = "*",
	command = "set fo-=c fo-=r fo-=o",
})

-- Restore cursor location when file is opened
autocmd("BufReadPost", {
    group = augroup("RestoreCursor", {}),
	pattern = { "*" },
	command = 'silent! normal! g`"zv',
})

-- insert -> normal でfcitxを英語モードに
autocmd("insertLeave", {
    group = augroup("LeaveJapaneseLeaveInsert", {}),
    pattern = "*",
    command = "silent! :!fcitx5-remote -c"
})

-- 起動時に挨拶
autocmd("VimEnter", {
    group = augroup("Greegting", {}),
    pattern = "*",
    callback = function()
        local userName = os.getenv("USER")
        require("notify").notify({"Hello " .. userName}, "info", {
        title = "Hello",
        timeout = 1000,
    })

    end
})

-- insertを抜けるときにタブのジャンプスタックを削除
autocmd("insertLeavePre", {
    group = augroup("RemoveLuaSnipJumpStack", {}),
    pattern = "*",
    callback = function()
        local cursor = vim.api.nvim_win_get_cursor(0)
        local row = cursor[1]
        local col = cursor[2]
        local ls = require("luasnip")
        while ls.jumpable() do
            ls.jump(1)
        end
        vim.api.nvim_win_set_cursor(0, {row, col})
        print(row .. ":" .. col)
    end
})
