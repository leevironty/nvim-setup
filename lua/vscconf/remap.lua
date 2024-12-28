vim.g.mapleader = ' '
vim.g.maplocalleader = '\\'
-- vim.keymap.set('n', '<leader>pv', vim.cmd.Ex)
vim.keymap.set('n', ';', ':')
vim.keymap.set('v', ';', ':')
vim.keymap.set('i', 'jk', '<Esc>')
-- vim.keymap.set("n", "<leader>qs", function() require("persistence").load() end, {desc='session | load dir session'})
-- vim.keymap.set("n", "<leader>qS", function() require("persistence").select() end, {desc='session | select session to load'})
-- vim.keymap.set("n", "<leader>ql", function() require("persistence").load({ last = true }) end, {desc='session | load last session'})
-- vim.keymap.set("n", "<leader>qd", function() require("persistence").stop() end, {desc='session | stop session persistence (no saving)'})

