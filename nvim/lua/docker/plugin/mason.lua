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
      }
    })

    mason_lspconfig.setup({
      ensure_installed = {
      },
      utomatic_installation = true,
    })

    end,
}
