return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    { "antosha417/nvim-lsp-file-operations", config = true },
    "williamboman/mason-lspconfig.nvim",
  },
  config = function()
    local cmp_nvim_lsp = require("cmp_nvim_lsp")
    local util = require("lspconfig/util")

    local keymap = vim.keymap
    local opts = { noremap = true, silent = true }

    local on_attach = function(client, bufnr)
      local buf_opts = { noremap = true, silent = true, buffer = bufnr }

      keymap.set("n", "gr", "<cmd>Telescope lsp_references<CR>", {desc = "Show LSP references", buffer = bufnr})
      keymap.set("n", "gD", vim.lsp.buf.declaration, {desc = "Go to declaration", buffer = bufnr})
      keymap.set("n", "gd", vim.lsp.buf.definition, {desc = "Go to definition", buffer = bufnr})
      keymap.set("n", "gt", vim.lsp.buf.type_definition, {desc = "Go to type definition", buffer = bufnr})
      keymap.set("n", "gi", vim.lsp.buf.implementation, {desc = "Go to implementation", buffer = bufnr})
      keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, {desc = "Signature help", buffer = bufnr})
      keymap.set("n", "K", vim.lsp.buf.hover, {desc = "Show documentation for what is under cursor", buffer = bufnr})
      keymap.set("n", "<leader>dj", vim.diagnostic.goto_next, {desc = "Go to next diagnostic", buffer = bufnr})
      keymap.set("n", "<leader>dk", vim.diagnostic.goto_prev, {desc = "Go to previous diagnostic", buffer = bufnr})
      keymap.set("n", "<leader>ds", vim.diagnostic.open_float, {desc = "Show diagnostic", buffer = bufnr})
      keymap.set("n", "dl", "<cmd>Telescope diagnostics<CR>", {desc = "Diagnostic list", buffer = bufnr})
      keymap.set("n", "<leader>r", vim.lsp.buf.rename, {desc = "Rename", buffer = bufnr})
    end

    -- Configure diagnostic signs and float window using the new API
    vim.diagnostic.config({
      signs = {
        text = {
          [vim.diagnostic.severity.ERROR] = "E",
          [vim.diagnostic.severity.WARN] = "W",
          [vim.diagnostic.severity.HINT] = "H",
          [vim.diagnostic.severity.INFO] = "I",
        },
      },
      virtual_text = true,
      underline = true,
      update_in_insert = false,
      severity_sort = true,
      float = {
        border = "rounded",
        source = true,
        header = "",
        prefix = "",
      },
    })

    -- Ensure diagnostic float has a visible background
    vim.api.nvim_create_autocmd("ColorScheme", {
      pattern = "*",
      callback = function()
        -- Set a visible background for diagnostic floats
        vim.api.nvim_set_hl(0, "DiagnosticFloatingError", { link = "DiagnosticError" })
        vim.api.nvim_set_hl(0, "DiagnosticFloatingWarn", { link = "DiagnosticWarn" })
        vim.api.nvim_set_hl(0, "DiagnosticFloatingInfo", { link = "DiagnosticInfo" })
        vim.api.nvim_set_hl(0, "DiagnosticFloatingHint", { link = "DiagnosticHint" })
      end,
    })

    -- nvim-cmp supports additional completion capabilities
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = cmp_nvim_lsp.default_capabilities(capabilities)

    local lspconfig = require("lspconfig")

    -- Enable the following language servers
    local servers = {
      'cssls',
      'html',
      'ts_ls',
      'lua_ls',
      'pyright',
    }
    for _, lsp in ipairs(servers) do
      lspconfig[lsp].setup({
        on_attach = on_attach,
        capabilities = capabilities,
      })
    end

    lspconfig.gopls.setup({
      on_attach = on_attach,
      capabilities = capabilities,
      filetypes = {"go", "gomod", "gowork", "gotmpl"},
      root_dir = util.root_pattern(".git", "go.mod", "go.work"),
      cmd = {"gopls"},
      single_file_support = true,
      settings = {
        gopls = {
          completeUnimported = true,
          gofumpt = true,
          analyses = {
            unusedparams = true,
          },
        },
      },
    })
  end
}
