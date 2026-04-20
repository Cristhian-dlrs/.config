return {
    "seblyng/roslyn.nvim",
    enabled = true,
    ft = "cs",
    config = function()
        vim.lsp.config("roslyn", {
            on_attach = function()
                print("This will run when the server attaches!")
            end,
            settings = {},
        })
        local roslyn = require("roslyn")
        roslyn.setup()

        vim.api.nvim_create_autocmd({ "InsertLeave" }, {
            pattern = "*",
            callback = function()
                local clients = vim.lsp.get_clients({ name = "roslyn" })
                if not clients or #clients == 0 then
                    return
                end

                local client = clients[1]
                local buffers = vim.lsp.get_buffers_by_client_id(clients[1].id)
                for _, buf in ipairs(buffers) do
                    client.request(
                        "textDocument/diagnostic",
                        { textDocument = vim.lsp.util.make_text_document_params(buf) },
                        nil,
                        buf
                    )
                end
                print("Client refresh ")
            end,
        })
    end,
}
