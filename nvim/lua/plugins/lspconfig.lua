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

    -- Configure diagnostic signs and float window using the new API
    require("config.diagnostic_box").set_diagnostic_box_settings()

    -- nvim-cmp supports additional completion capabilities
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = cmp_nvim_lsp.default_capabilities(capabilities)

    -- Enable the following language servers
    local servers = {
      "cssls",
      "html",
      "ts_ls",
      "lua_ls",
      "pyright",
    }
    for _, server in ipairs(servers) do
      vim.lsp.config(server, {
        capabilities = capabilities,
      })
      vim.lsp.enable(server)
    end

    vim.lsp.config("gopls", {
      capabilities = capabilities,
      filetypes = { "go", "gomod", "gowork", "gotmpl" },
      cmd = { "gopls" },
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
    vim.lsp.enable("gopls")
  end,
}
