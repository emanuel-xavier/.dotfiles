-- Create an augroup for our LSP configurations.
-- This is where we will put all of our LSP related autocommands.
local lsp_augroup = vim.api.nvim_create_augroup("lsp_augroup", { clear = true })

vim.api.nvim_create_autocmd("LspAttach", {
  group = lsp_augroup,
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    local bufnr = args.buf
    require("config.lsp").set_lsp_keymaps(client, bufnr)
  end,
})
