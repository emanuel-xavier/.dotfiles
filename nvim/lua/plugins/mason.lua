return {
  "williamboman/mason.nvim",
  dependencies = {
   	"williamboman/mason-lspconfig.nvim",
  },
  config = function()
    local mason = require("mason")
    local mason_lspconfig = require("mason-lspconfig")

    mason.setup({
      ensure_installed = {
        -- Linter
        "golangci-lint",
        "pylint",
        -- Formatter
        "gofumpt",
        "goimports",
        "goimports-reviser",
        "prettier",
        "typescript-language-server",
      }
    })

    mason_lspconfig.setup({
      ensure_installed = {
        "cssls",
        "html",
        "gopls",
        "jdtls",
        "lua_ls",
        "pyright",
        "ts_ls",
      },
      utomatic_installation = true,
    })

    end,
}
