vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.g.mapleader = " "
vim.opt.number = true
require("config.lazy")

local config = require("nvim-treesitter.configs")
config.setup({
  auto_install = true,
  highlight = { enable = true },
  indent = { enable = true },
})

require("neo-tree").setup({
  window = {
    width = 30,
  },
})


local builtin = require('telescope.builtin')
vim.keymap.set('n', '<C-p>', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
vim.keymap.set('n', '<leader>d', vim.lsp.buf.definition, { noremap = true, silent = true })
vim.keymap.set('n', '<leader>e', ':Neotree filesystem reveal left<CR>', {})
vim.keymap.set('n', '<leader>t', ':botright 10split | terminal<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>c', vim.lsp.buf.code_action, { noremap = true, silent = true })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<C-s>', ':w<CR>', {})
vim.keymap.set("t", "<C-Tab>", [[<C-\><C-n>]], { noremap = true, silent = true })
vim.keymap.set("n", "<leader>q", ":q<CR>", { noremap = true, silent = true, desc = "Fechar janela atual" })

vim.o.background = "dark" -- or "light" for light mode
vim.cmd([[colorscheme gruvbox]])

