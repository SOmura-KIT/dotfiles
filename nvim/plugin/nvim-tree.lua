local keymap = vim.keymap.set
keymap({ 'n' }, '<Space>t', '<CMD>NvimTreeToggle<CR>', { noremap = true })
keymap({ 'n' }, '<Space>f', '<CMD>NvimTreeFocus<CR>', { noremap = true })
