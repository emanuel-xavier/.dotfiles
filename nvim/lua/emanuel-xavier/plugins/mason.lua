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
        "cpplint",
        "eslint_d", 
        "golangci-lint",
        "pylint",
        -- Formatter
        "clang-format",
        "gofumpt",
        "goimports",
        "goimports-reviser",
        "prettier",
        "sqlfmt",
        "typescript-language-server"
      }
    })

    mason_lspconfig.setup({
      ensure_installed = {
        "lua_ls",
        "rust_analyzer",
        "esbonio",
        "clangd",
        "gopls",
        "ts_ls",
        "pyright",
        "sqlls",
        "html",
        "cssls",
        "jdtls",
      },
      utomatic_installation = true,
    })

    end,
}
