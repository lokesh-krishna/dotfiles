-- switch buffers quickly
vim.keymap.set('n', '<C-n>', vim.cmd.bn)
vim.keymap.set('n', '<C-p>', vim.cmd.bp)

-- telescope bindings
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fs', builtin.grep_string, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fc', builtin.spell_suggest, {})
vim.keymap.set('n', '<leader>fn', '<cmd>Telescope notify<CR>')

-- undotree
vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle)

-- zenmode and twilight
vim.keymap.set('n', '<leader>zm', vim.cmd.ZenMode)
vim.keymap.set('n', '<leader>tw', vim.cmd.Twilight)

-- nvim-tree
vim.keymap.set('n', '<leader>nt', vim.cmd.NvimTreeToggle)

-- telekasten
vim.keymap.set('n', '<leader>tf', '<cmd>Telekasten find_notes<CR>')
vim.keymap.set('n', '<leader>tg', '<cmd>Telekasten search_notes<CR>')
vim.keymap.set('n', '<leader>tz', '<cmd>Telekasten follow_link<CR>')
vim.keymap.set('n', '<leader>tn', '<cmd>Telekasten new_note<CR>')
vim.keymap.set('n', '<leader>tb', '<cmd>Telekasten show_backlinks<CR>')
vim.keymap.set('n', '<leader>tB', '<cmd>Telekasten find_friends<CR>')
vim.keymap.set('n', '<leader>t#', '<cmd>Telekasten show_tags<CR>')
vim.keymap.set('i', '<leader>[', '<ESC>:lua require("telekasten").insert_link()<CR>')

-- lsp
vim.keymap.set('n', '<leader>do', '<cmd>lua vim.diagnostic.open_float()<CR>')
vim.keymap.set('n', '<leader>dn', '<cmd>lua vim.diagnostic.goto_next()<CR>')
vim.keymap.set('n', '<leader>dp', '<cmd>lua vim.diagnostic.goto_prev()<CR>')
vim.keymap.set('n', '<leader>ds', '<cmd>lua vim.diagnostic.show()<CR>')

vim.keymap.set('n', '<leader>ld', '<cmd>lua vim.lsp.buf.definition()<CR>')
vim.keymap.set('n', '<leader>la', '<cmd>lua vim.lsp.buf.code_action()<CR>')
vim.keymap.set('n', '<leader>lr', '<cmd>lua vim.lsp.buf.references()<CR>')
vim.keymap.set('n', '<leader>li', '<cmd>lua vim.lsp.buf.implementation()<CR>')
vim.keymap.set('n', '<leader>lh', '<cmd>lua vim.lsp.buf.hover()<CR>')
vim.keymap.set('n', '<leader>ls', '<cmd>lua vim.lsp.buf.signature_help()<CR>')

vim.keymap.set('n', '<leader>tr', vim.cmd.TroubleToggle)

