local keymap = vim.keymap.set

keymap("", "<Space>",   "<Nop>",    { noremap = true })
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- remove tmux prefix key
keymap({ "n", "i", "v", "c", "t"}, "<C-j>", "<Nop>", { noremap = true })

-- cursor moving
keymap({ "n", "v" },    "j",    "gj",   { noremap = true })
keymap({ "n", "v" },    "gj",   "j",    { noremap = true })
keymap({ "n", "v" },    "k",    "gk",   { noremap = true })
keymap({ "n", "v" },    "gk",   "k",    { noremap = true })
keymap({ "n", "v" },    "<C-H>",    "^",    { noremap = true })

-- visual grep
keymap("v", "/", "y/<C-R>\"<CR>", { noremap = true })

keymap("n", "<C-[>",    "<C-c>",    { noremap = true, silent = true })

-- commahd
keymap("n", "::",       ":!",       { noremap = true })
keymap("c", "<C-[>",    "<C-c>",    { noremap = true })
keymap("c", "<ESC>",    "<C-c>",    { noremap = true })
keymap("c", "<C-f>",    "<Right>",  { noremap = true })
keymap("c", "<C-b>",    "<Left>",   { noremap = true })

-- window
keymap("n", "<C-w>n",       "<Nop>",                    { noremap = true }) -- split brank file
keymap("n", "<C-w>t",       ":vs<CR>:term<CR>",         { noremap = true }) -- move top left window
keymap("n", "<C-w><C-t>",   ":vs<CR>:term<CR>",         { noremap = true }) -- move top left window
keymap("n", "<C-w>T",       ":sp<CR><C-w>j:term<CR>",   { noremap = true }) -- move top left window

-- write and quit
keymap("n", "<Leader>h",    ":noh<CR>", { noremap = true })
keymap("n", "<Leader>ww",   ":w<CR>",   { noremap = true })
keymap("n", "<Leader>wq",   ":wq<CR>",  { noremap = true })
keymap("n", "<Leader>qq",   ":q<CR>",   { noremap = true })

-- toggle relative number
keymap("n", "<Leader>n",    ":lua vim.opt[\"relativenumber\"] = not vim.o[\"relativenumber\"]<CR>",    { noremap = true })

-- cursor moving in insert
keymap("i", "<C-f>",    "<Right>",  { noremap = true })
keymap("i", "<C-b>",    "<Left>",   { noremap = true })

-- del in insert
keymap("i", "<C-d>",    "<Del>",    { noremap = true })

-- terminal -> normal shortcut
keymap("t", "<C-[>",    "<C-\\><C-n>",  { noremap = true })
keymap("t", "<C-w>",    "<C-\\><C-n><C-w>", { noremap = true })

-- lsp
local lsp = "<C-l>"
keymap("n", lsp .. "e", vim.diagnostic.open_float,  {})
keymap("n", lsp .. "<C-p>", vim.diagnostic.goto_prev,   {})
keymap("n", lsp .. "<C-n>", vim.diagnostic.goto_next,   {})
keymap("n", lsp .. "q", vim.diagnostic.setloclist,  {})
vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("UserLspConfig", {}),
    callback = function(ev)
        keymap("n", lsp .. "D",       vim.lsp.buf.declaration,            { buffer = ev.buf })
        keymap("n", lsp .. "d",       vim.lsp.buf.definition,             { buffer = ev.buf })
        keymap("n", lsp .. "h",       vim.lsp.buf.hover,                  { buffer = ev.buf })
        keymap("n", lsp .. "i",       vim.lsp.buf.implementation,         { buffer = ev.buf })
        keymap("n", lsp .. "<C-l>",   vim.lsp.buf.signature_help,         { buffer = ev.buf })
        keymap("n", lsp .. "wa",      vim.lsp.buf.add_workspace_folder,   { buffer = ev.buf })
        keymap("n", lsp .. "wr",      vim.lsp.buf.remove_workspace_folder,{ buffer = ev.buf })
        keymap("n", lsp .. "wl",function()
            print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end, { buffer = ev.buf })
        keymap("n", lsp .. "t",       vim.lsp.buf.type_definition,        { buffer = ev.buf })
        keymap("n", lsp .. "n",       vim.lsp.buf.rename,                 { buffer = ev.buf })
        keymap("n", lsp .. "r",       vim.lsp.buf.references,             { buffer = ev.buf })
        keymap("n", lsp .. "f", function()
            vim.lsp.buf.format { async = true }
        end, { buffer = ev.buf })
        keymap({ "n", "v" }, lsp .. "a", vim.lsp.buf.code_action,      { buffer = ev.buf })
    end,
})

-- cmp

-- telescope
local telescope = "<C-t>"
keymap("n", telescope .. "<C-t>",   ":Telescope<CR>",           { noremap = true })
keymap("n", telescope .. "b",       ":Telescope buffers<CR>", { noremap = true })
keymap("n", telescope .. "d",       ":Telescope diagnostics<CR>",{ noremap = true })
keymap("n", telescope .. "fb",      ":Telescope file_browser<CR>", { noremap = true })
keymap("n", telescope .. "fo",      ":Telescope oldfiles<CR>", { noremap = true })
keymap("n", telescope .. "ff",      ":Telescope find_files<CR>",{ noremap = true })
keymap("n", telescope .. "h",       ":Telescope help_tags<CR>", { noremap = true })
keymap("n", telescope .. "k",       ":Telescope keymaps<CR>",   { noremap = true })
keymap("n", telescope .. "n",       ":Telescope notify<CR>",    { noremap = true })
keymap("n", telescope .. "p",       ":Telescope packer<CR>",    { noremap = true })
keymap("n", telescope .. "t",       ":Telescope<CR>",           { noremap = true })

-- copilot
vim.cmd('imap <silent><script><expr> <C-l> copilot#Accept("\\<CR>")')
