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
      }
    })

    mason_lspconfig.setup({
      ensure_installed = {
        "lua_ls",
        "rust_analyzer",
        "esbonio",
        "clangd",
        "gopls",
        "tsserver",
        "pyright",
        "sqlls",
        "html",
        "cssls",
      },
      utomatic_installation = true,
    })

    end,
}
