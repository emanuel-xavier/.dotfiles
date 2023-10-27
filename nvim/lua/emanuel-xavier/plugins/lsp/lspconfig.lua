return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    { "antosha417/nvim-lsp-file-operations", config = true },
  },
  config = function()
    local lspconfig = require("lspconfig")
    local cmp_nvim_lsp = require("cmp_nvim_lsp")
    local util = require("lspconfig/util")

    local keymap = vim.keymap
    local opts = { noremap = true, silent = true }
    local on_attach = function(client, bufnr)
      opts.bufnr = bufnr

      opts.desc = "Show LSP references"
      keymap.set("n", "gr", "<cmd>Telescope lsp_references<CR>", {buffer=0})

      opts.desc = "Go to declaration"
      keymap.set("n", "gD", vim.lsp.buf.declaration)

      opts.desc = "Go to definition"
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, {buffer=0})

      opts.desc = "Go to type definition"
      vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, {buffer=0})

      opts.desc = "Go to implementation"
      vim.keymap.set("n", "gt", vim.lsp.buf.implementation, {buffer=0})

      vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, {buffer=0})

      opts.desc = "Show documentation for what is under cursor"
      keymap.set("n", "K", vim.lsp.buf.hovers)

      opts.desc = "Go to next diagnostic"
      keymap.set("n", "<leader>dj", vim.diagnostic.goto_next, {buffer=0})

      opts.desc = "Go to previous diagnostic"
      keymap.set("n", "<leader>dk", vim.diagnostic.goto_next, {buffer=0})

      opts.desc = "Diagnostic list"
      keymap.set("n", "dl", "<cmd>Telescope diagnostic<cr>")

      opts.desc = "Rename"
      keymap.set("n", "<leader>r", vim.lsp.buf.rename, {buffer=0})
    end

    local signs = { Error = "E", Warn = "W", Hint = "H", Info = "I" }
    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    end

     -- nvim-cmp supports additional completion capabilities
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

    -- Enable the following language servers
    local servers = { 
      'pyright', 
      'clangd', 
      'sqlls', 
      'svelte',
      'html',
      'cssls',
      'esbonio',
    }
    for _, lsp in ipairs(servers) do
      lspconfig[lsp].setup {
        on_attach = on_attach,
        capabilities = capabilities,  
      }
    end

    lspconfig.gopls.setup({
      on_attach = on_attach,
      capabilities = capabilities,
      filetypes = {"go", "gomod", "gowork", "gotmpl"},
      root_dir = util.root_pattern({".git", "go.mod", "go.work"}),
      cmd = {"gopls"},
      single_file_support = true,
      settings = {
        gopls = {
          completeUnimported = true,
          -- usePlaceholders = true,
          gofumpt = true,
          analyses = {
            unusedparams = true,
          },
        },
      },     
    })

    lspconfig.rust_analyzer.setup({
      on_attach = on_attach,
      capabilities = capabilities,
      filetypes = {"rust"},
      root_dir = util.root_pattern("Cargo.toml"),
      settings = {
        ["rust-analyzer"] = {
          cargo = {
            akllFeatures = true,
          }
        }
      }
    })
end
}
