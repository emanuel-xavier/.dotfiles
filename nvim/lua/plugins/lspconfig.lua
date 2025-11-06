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

    local on_attach = function(client, bufnr)
      require("config.lsp").set_lsp_keymaps(client, bufnr)
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
    -- Note: jdtls is NOT in this list because it has custom configuration in config/jdtls.lua
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

    -- Explicitly disable jdtls automatic setup from lspconfig
    -- It will be configured via our custom config/jdtls.lua
    lspconfig.jdtls.setup = function()
      -- Do nothing, we handle jdtls manually
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
