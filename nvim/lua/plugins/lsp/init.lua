
return {
  'neovim/nvim-lspconfig',
  event = { 'BufReadPre', 'BufNewFile' },
  dependencies = {
    'hrsh7th/cmp-nvim-lsp',
    { 'antosha417/nvim-lsp-file-operations', config = true },
    'williamboman/mason-lspconfig.nvim',
  },
  config = function()
    local cmp_nvim_lsp = require('cmp_nvim_lsp')
    local util = require('lspconfig/util')

    local keymap = vim.keymap
    local on_attach = function(client, bufnr)
      local opts = { noremap = true, silent = true, buffer = bufnr, client = client }

      opts.desc =  'Show LSP references'
      keymap.set('n', 'gr', '<cmd>Telescope lsp_references<CR>', opts)

      opts.desc =  'Go to declaration'
      keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)

      opts.desc =  'Go to definition'
      keymap.set('n', 'gd', vim.lsp.buf.definition, opts)

      opts.desc =  'Go to type definition'
      keymap.set('n', 'gt', vim.lsp.buf.type_definition, opts)

      opts.desc =  'Go to implementation'
      keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)

      opts.desc =  'Signature help'
      keymap.set('i', '<C-h>', vim.lsp.buf.signature_help, opts)

      opts.desc = 'Show documentation for what is under cursor'
      keymap.set('n', 'K', vim.lsp.buf.hover, opts)

      opts.desc =  'Go to next diagnostic'
      keymap.set('n', '<leader>dj', vim.diagnostic.goto_next, opts)

      opts.desc =  'Go to previous diagnostic'
      keymap.set('n', '<leader>dk', vim.diagnostic.goto_prev, opts)

      opts.desc =  'Show diagnostic'
      keymap.set('n', '<leader>ds', vim.diagnostic.open_float, opts)

      opts.desc =  'Diagnostic list'
      keymap.set('n', 'dl', '<cmd>Telescope diagnostics<CR>', opts)

      opts.desc =  'Rename'
      keymap.set('n', '<leader>r', vim.lsp.buf.rename, opts)
    end

    vim.diagnostic.config({
      signs = {
        text = {
          [vim.diagnostic.severity.ERROR] = 'E',
          [vim.diagnostic.severity.WARN] = 'W',
          [vim.diagnostic.severity.HINT] = 'H',
          [vim.diagnostic.severity.INFO] = 'I',
        },
      },
      virtual_text = true,
      underline = true,
      update_in_insert = false,
      severity_sort = true,
      float = {
        border = 'rounded',
        source = true,
        header = '',
        prefix = '',
      },
    })

    -- Ensure diagnostic float has a visible background
    vim.api.nvim_create_autocmd('ColorScheme', {
      pattern = '*',
      callback = function()
        -- Set a visible background for diagnostic floats
        vim.api.nvim_set_hl(0, 'DiagnosticFloatingError', { link = 'DiagnosticError' })
        vim.api.nvim_set_hl(0, 'DiagnosticFloatingWarn', { link = 'DiagnosticWarn' })
        vim.api.nvim_set_hl(0, 'DiagnosticFloatingInfo', { link = 'DiagnosticInfo' })
        vim.api.nvim_set_hl(0, 'DiagnosticFloatingHint', { link = 'DiagnosticHint' })
      end,
    })

    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = cmp_nvim_lsp.default_capabilities(capabilities)
    vim.lsp.config('*', {
      capabilities = capabilities,
    })

    -- Enable the following language servers
    local servers = {
      'cssls',
      'html',
      'ts_ls',
      'lua_ls',
      'pyright',
    }
    for _, lsp in ipairs(servers) do
      vim.lsp.config(lsp, {
        on_attach = on_attach,
      })
      vim.lsp.enable(lsp)
    end

    vim.lsp.config('gopls', {
      on_attach = on_attach,
      filetypes = {'go', 'gomod', 'gowork', 'gotmpl'},
      -- root_dir = util.root_pattern('.git', 'go.mod', 'go.work'),
      cmd = {'gopls'},
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
    vim.lsp.enable('gopls')
  end
}
