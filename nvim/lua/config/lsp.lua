local set_lsp_keymaps = function(client, bufnr)
  local opts = { noremap = true, silent = true, buffer = bufnr }
  local keymap = vim.keymap

  opts.desc = "Show LSP references"
  keymap.set("n", "gr", "<cmd>Telescope lsp_references<CR>", opts)
  opts.desc = "Go to declaration"
  keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
  opts.desc = "Go to definition"
  keymap.set("n", "gd", vim.lsp.buf.definition, opts)
  opts.desc = "Go to type definition"
  keymap.set("n", "gt", vim.lsp.buf.type_definition, opts)
  opts.desc = "Go to implementation"
  keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
  opts.desc = "Signature help"
  keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)
  opts.desc = "Show documentation for what is under cursor"
  keymap.set("n", "K", vim.lsp.buf.hover, opts)
  opts.desc = "Go to next diagnostic"
  keymap.set("n", "<leader>dj", vim.diagnostic.goto_next, opts)
  opts.desc = "Go to previous diagnostic"
  keymap.set("n", "<leader>dk", vim.diagnostic.goto_prev, opts)
  opts.desc = "Show diagnostic"
  keymap.set("n", "<leader>ds", vim.diagnostic.open_float, opts)
  opts.desc = "Diagnostic list"
  keymap.set("n", "dl", "<cmd>Telescope diagnostics<CR>", opts)
  opts.desc = "Rename"
  keymap.set("n", "<leader>r", vim.lsp.buf.rename, opts)
end

return {
  set_lsp_keymaps = set_lsp_keymaps
}
