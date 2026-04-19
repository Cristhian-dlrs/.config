return {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
        -- add any options here
        routes = {
            {
                filter = {
                    event = "msg_show",
                    kind = { "warn", "error" },
                },
                opts = { skip = true },
            },
            {
                filter = {
                    event = "notify",
                    kind = { "warn", "error" },
                },
                opts = { skip = true },
            },
            {
                -- Skip lsp messages (like "error: xyz") that cause duplicates
                filter = {
                    event = "lsp",
                    kind = "message",
                },
                opts = { skip = true },
            },
        },
    },
    config = function()
        require("noice").setup({
            presets = {
                command_palette = true, -- position the cmdline and popupmenu together
                inc_rename = false, -- enables an input dialog for inc-rename.nvim
                lsp_doc_border = false, -- add a border to hover docs and signature help
            },
            cmdline = {
                view = "cmdline_popup",
            },
            views = {
                cmdline_popup = {
                    position = {
                        row = "40%",
                        col = "50%",
                    },
                    size = {
                        width = 60,
                        height = "auto",
                    },
                    border = {
                        style = "rounded",
                    },
                    win_options = {
                        winblend = 0,
                    },
                },
            },
        })
    end,
    dependencies = {
        -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
        "MunifTanjim/nui.nvim",
        -- OPTIONAL:
        --   `nvim-notify` is only needed, if you want to use the notification view.
        --   If not available, we use `mini` as the fallback
        "rcarriga/nvim-notify",
    },
}
