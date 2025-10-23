
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

    -- Special handling for jdtls, which needs to be configured on FileType
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "java",
      callback = function()
        -- Stop any existing jdtls client to ensure a clean start
        local clients = vim.lsp.get_clients({ bufnr = 0, name = "jdtls" })
        for _, client in ipairs(clients) do
          vim.lsp.stop_client(client.id)
        end

        local root_markers = {'gradlew', 'mvnw', '.git', 'pom.xml', 'build.gradle'}
        local root_marker = vim.fs.find(root_markers, { upward = true })[1]

        if not root_marker then
          return -- No Java project root found, do not start jdtls
        end
        local root_dir = vim.fs.dirname(root_marker)

        local jdtls_path = vim.fn.expand("~/.local/share/nvim/mason/packages/jdtls")
        local lombok_path = jdtls_path .. "/lombok.jar"

        local config = {
          on_attach = on_attach, -- Use the shared on_attach function
          cmd = {
            'java',
            '-Declipse.application=org.eclipse.jdt.ls.core.id1',
            '-Dosgi.bundles.defaultStartLevel=4',
            '-Declipse.product=org.eclipse.jdt.ls.core.product',
            '-Dlog.protocol=true',
            '-Dlog.level=ALL',
            '-javaagent:' .. lombok_path,
            '-Xbootclasspath/a:' .. lombok_path,
            '-Xms1g',
            '--add-modules=ALL-SYSTEM',
            '--add-opens', 'java.base/java.util=ALL-UNNAMED',
            '--add-opens', 'java.base/java.lang=ALL-UNNAMED',
            '-jar', vim.fn.glob(jdtls_path .. '/plugins/org.eclipse.equinox.launcher_*.jar'),
            '-configuration', jdtls_path .. '/config_linux',
            '-data', vim.fn.expand('~/.cache/nvim/jdtls/workspace') .. '/' .. vim.fn.fnamemodify(root_dir, ':p:h:t'),
          },
          root_dir = root_dir,
          settings = {
            java = {
              eclipse = {
                downloadSources = true,
              },
              configuration = {
                updateBuildConfiguration = "interactive",
              },
              maven = {
                downloadSources = true,
              },
              implementationsCodeLens = {
                enabled = true,
              },
              referencesCodeLens = {
                enabled = true,
              },
              references = {
                includeDecompiledSources = true,
              },
              format = {
                enabled = true,
              },
            },
            signatureHelp = { enabled = true },
            completion = {
              favoriteStaticMembers = {
                "org.hamcrest.MatcherAssert.assertThat",
                "org.hamcrest.Matchers.*",
                "org.hamcrest.CoreMatchers.*",
                "org.junit.jupiter.api.Assertions.*",
                "java.util.Objects.requireNonNull",
                "java.util.Objects.requireNonNullElse",
                "org.mockito.Mockito.*",
              },
            },
            contentProvider = { preferred = "fernflower" },
            extendedClientCapabilities = {
              progressReportProvider = false,
            },
            sources = {
              organizeImports = {
                starThreshold = 9999,
                staticStarThreshold = 9999,
              },
            },
            codeGeneration = {
              toString = {
                template = "${object.className}{${member.name()}=${member.value}, ${otherMembers}}",
              },
              useBlocks = true,
            },
          },
          init_options = {
            bundles = {},
          },
        }

        require('jdtls').start_or_attach(config)
      end,
    })
  end
}
