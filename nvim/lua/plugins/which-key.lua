return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = function()
        vim.opt.timeout = true
        vim.opt.timeoutlen = 500

        require("which-key").setup({
            spec = {
                -- ========== GIT / COMMENT ==========
                {
                    "<leader>c",
                    group = "comment / code actions",
                },
                { "<leader>cl", "gcc", mode = "n", remap = true, desc = "Comment line" },
                { "<leader>ce", "gcA", mode = "n", remap = true, desc = "Comment end of line" },
                { "<leader>cl", "gc",  mode = "v", remap = true, desc = "Comment selection" },
                { "<leader>cb", "gb",  mode = "v", remap = true, desc = "Block comment selection" },

                -- ========== WINDOW ==========
                {
                    "<leader>w",
                    group = "window",
                },
                { "<leader>ws", "<cmd>vsplit<CR>", desc = "Vertical split" },
                { "<leader>q",  "<cmd>q<CR>",      desc = "Quit window" },

                -- ========== NAVIGATION ==========
                {
                    "<C-h>",
                    "<C-w>h",
                    desc = "Move left window",
                },
                { "<C-j>", "<C-w>j", desc = "Move down window" },
                { "<C-k>", "<C-w>k", desc = "Move up window" },
                { "<C-l>", "<C-w>l", desc = "Move right window" },

                -- ========== SEARCH / FILES ==========
                {
                    "<leader>f",
                    group = "find",
                },
                {
                    "<leader>fa",
                    function()
                        require("telescope.builtin").live_grep()
                    end,
                    desc = "Find in files",
                },
                {
                    "<leader>fr",
                    function()
                        require("telescope.builtin").oldfiles()
                    end,
                    desc = "Recent files",
                },

                -- ========== GIT ==========
                {
                    "<leader>g",
                    group = "git",
                },
                {
                    "<leader>gb",
                    function()
                        require("telescope.builtin").git_branches()
                    end,
                    desc = "Branches",
                },
                {
                    "<leader>gc",
                    function()
                        require("telescope.builtin").git_commits()
                    end,
                    desc = "Commits",
                },
                {
                    "<leader>gs",
                    function()
                        require("telescope.builtin").git_status()
                    end,
                    desc = "Status",
                },
                { "<leader>gg", "<cmd>Neogit<cr>",     desc = "Open neogit" },

                -- ========== LSP ==========
                {
                    "<leader>l",
                    group = "lsp",
                },
                {
                    "<leader>fc",
                    function()
                        vim.lsp.buf.format()
                    end,
                    desc = "Format",
                },
                {
                    "<leader>gh",
                    function()
                        vim.lsp.buf.hover()
                    end,
                    desc = "Hover",
                },
                {
                    "<leader>ca",
                    function()
                        vim.lsp.buf.code_action()
                    end,
                    desc = "Code action",
                },
                {
                    "<leader>rn",
                    function()
                        vim.lsp.buf.rename()
                    end,
                    desc = "Rename",
                },

                -- direct LSP motions
                {
                    "gd",
                    function()
                        vim.lsp.buf.definition()
                    end,
                    desc = "Definition",
                },
                {
                    "gi",
                    function()
                        vim.lsp.buf.implementation()
                    end,
                    desc = "Implementation",
                },
                {
                    "gu",
                    function()
                        vim.lsp.buf.references()
                    end,
                    desc = "References",
                },
                {
                    "gs",
                    function()
                        vim.lsp.buf.signature_help()
                    end,
                    desc = "Signature help",
                },

                -- ========== EDITING ==========
                { "<Esc>",      "<cmd>nohlsearch<CR>", desc = "Clear search highlight" },
                { "U",          "<cmd>redo<CR>",       desc = "Redo" },

                { ">",          ">>",                  desc = "Indent right" },
                { "<",          "<<",                  desc = "Indent left" },

                { "Q",          "@qj",                 mode = "n",                     desc = "Run macro q" },
                { "Q",          ":norm @q<CR>",        mode = "x",                     desc = "Run macro selection" },

                {
                    "p",
                    "P",
                    mode = "v",
                    desc = "Paste without overwrite",
                },

                { "Y",          "viwy",     mode = "n",            desc = "Yank word" },
                { "P",          "viwpviwy", mode = "n",            desc = "Paste + re-yank" },

                -- ========== LINE ACTIONS ==========
                { "<leader>ye", "v$y",      desc = "Yank to end" },
                { "<leader>ce", "c$",       desc = "Change to end" },
                { "<leader>de", "d$",       desc = "Delete to end" },
                { "<leader>ve", "v$",       desc = "Visual to end" },

                -- ========== FILE TREE ==========
                {
                    "<leader>e",
                    "<cmd>Neotree filesystem reveal left<CR>",
                    desc = "File explorer",
                },

                -- ========== FLASH ==========
                {
                    "s",
                    function()
                        require("flash").jump()
                    end,
                    mode = { "n", "x", "o" },
                    desc = "Flash jump",
                },
                {
                    "S",
                    function()
                        require("flash").treesitter()
                    end,
                    mode = { "n", "x", "o" },
                    desc = "Flash treesitter",
                },
                {
                    "r",
                    function()
                        require("flash").remote()
                    end,
                    mode = "o",
                    desc = "Remote flash",
                },
                {
                    "R",
                    function()
                        require("flash").treesitter_search()
                    end,
                    mode = { "o", "x" },
                    desc = "Treesitter search",
                },
                {
                    "<C-s>",
                    function()
                        require("flash").toggle()
                    end,
                    mode = "c",
                    desc = "Toggle flash search",
                },
            },
        })
    end,
}
