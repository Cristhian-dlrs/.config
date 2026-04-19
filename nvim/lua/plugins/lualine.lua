return {
    "nvim-lualine/lualine.nvim",
    config = function()
        require("lualine").setup({
            -- Shows notifications like recording macro in lualine
            sections = {
                lualine_x = {
                    {
                        require("noice").api.statusline.mode.get,
                        cond = require("noice").api.statusline.mode.has,
                        color = { fg = "#fff" },
                    },
                    "encoding",
                    "fileformat",
                    "filetype",
                },
            },
            options = {
                theme = "catppuccin-mocha",
                sections = {
                    lualine_a = {
                        file = 1,
                    },
                },
            },
        })
    end,
}
