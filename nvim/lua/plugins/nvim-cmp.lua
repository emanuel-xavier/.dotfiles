return {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  dependencies = {
    "hrsh7th/cmp-vsnip", "hrsh7th/cmp-nvim-lsp", "hrsh7th/cmp-nvim-lua",
    "hrsh7th/cmp-nvim-lsp-signature-help", "hrsh7th/vim-vsnip",
    "hrsh7th/cmp-buffer", "hrsh7th/cmp-path", "L3MON4D3/LuaSnip"
  },
  config = function()
    local cmp = require("cmp")
    local luasnip = require("luasnip")

    vim.opt.completeopt = {"menuone", "noselect", "noinsert", "preview"}
    vim.opt.shortmess = vim.opt.shortmess + {c = true}

    cmp.setup({
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end
      },

      mapping = cmp.mapping.preset.insert({
        ["<C-k>"] = cmp.mapping.select_prev_item(), -- previous suggestion
        ["<C-j>"] = cmp.mapping.select_next_item(), -- next suggestion
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestions
        ["<C-e>"] = cmp.mapping.abort(), -- close completion window
        ["<CR>"] = cmp.mapping.confirm({select = false})
      }),

      -- sources for autocompletion
      sources = cmp.config.sources({
        {name = "path"}, {name = "luasnip"},
        {name = "nvim_lsp"}, {name = "nvim_lua"},
        {name = "nvim_lsp_signature_help"},
        {name = "vsnip"},
        {name = "buffer"},
      }),

      window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      },

      formatting = {
        fields = {"menu", "abbr", "kind"},
        format = function(entry, item)
          local menu_icon = {
            nvim_lsp = 'λ',
            vsnip = '⋗',
            buffer = 'b',
            path = 'p'
          }
          item.menu = menu_icon[entry.source.name]
          return item
        end
      },

    })

  end
}
