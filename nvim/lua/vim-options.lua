vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")
vim.cmd("set relativenumber")
vim.cmd("set cursorline")
vim.g.mapleader = " "
vim.g.background = "light"
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.wo.number = true
vim.opt.swapfile = false
vim.opt.wrap = false

-- General
vim.api.nvim_set_keymap("n", "U", ":redo<cr>", { noremap = true, silent = true }) -- map redo to shift U ofr convinience
-- sync system clipboard
vim.opt.clipboard = "unnamedplus"

-- Clear search results
vim.keymap.set("n", "<esc>", ":nohlsearch<CR>")

-- Navigate vim panes better
vim.keymap.set("n", "<c-k>", ":wincmd k<CR>")
vim.keymap.set("n", "<c-j>", ":wincmd j<CR>")
vim.keymap.set("n", "<c-h>", ":wincmd h<CR>")
vim.keymap.set("n", "<c-l>", ":wincmd l<CR>")

-- Window split
vim.api.nvim_set_keymap("n", "<leader>ws", "<Cmd>vsplit<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>q", ":q<CR>")

-- Easy indent in normal mode
vim.api.nvim_set_keymap("n", ">", ">>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<", "<<", { noremap = true, silent = true })

-- Macros shortcuts
vim.keymap.set("n", "Q", "@qj")
vim.keymap.set("x", "Q", ":norm @q<CR>")

-- pasting without overwritting
vim.keymap.set("v", "p", "P")

-- advanced copy and paste
vim.keymap.set("n", "Y", "viwy")
vim.keymap.set("n", "P", "viwpviwy")

-- action to the end of line
vim.keymap.set("n", "<leader>ye", "v$y")
vim.keymap.set("n", "<leader>ce", "c$")
vim.keymap.set("n", "<leader>de", "d$")
vim.keymap.set("n", "<leader>ve", "v$")
