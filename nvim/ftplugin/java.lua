-- This file is loaded for Java files and will configure jdtls with Lombok support
local jdtls_path = vim.fn.expand("~/.local/share/nvim/mason/packages/jdtls")
local lombok_path = jdtls_path .. "/lombok.jar"

-- Get the current project root
local root_markers = {'gradlew', 'mvnw', '.git', 'pom.xml', 'build.gradle'}
local root_dir = vim.fs.dirname(vim.fs.find(root_markers, { upward = true })[1])

-- Stop any existing LSP clients for this buffer
local clients = vim.lsp.get_clients({ bufnr = 0 })
for _, client in ipairs(clients) do
  if client.name == "jdtls" then
    vim.lsp.stop_client(client.id)
  end
end

local config = {
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

-- Set up keymaps (copied from lspconfig.lua on_attach)
local keymap = vim.keymap
local bufnr = vim.api.nvim_get_current_buf()

keymap.set("n", "gr", "<cmd>Telescope lsp_references<CR>", {desc = "Show LSP references", buffer = bufnr})
keymap.set("n", "gD", vim.lsp.buf.declaration, {desc = "Go to declaration", buffer = bufnr})
keymap.set("n", "gd", vim.lsp.buf.definition, {desc = "Go to definition", buffer = bufnr})
keymap.set("n", "gt", vim.lsp.buf.type_definition, {desc = "Go to type definition", buffer = bufnr})
keymap.set("n", "gi", vim.lsp.buf.implementation, {desc = "Go to implementation", buffer = bufnr})
keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, {desc = "Signature help", buffer = bufnr})
keymap.set("n", "K", vim.lsp.buf.hover, {desc = "Show documentation for what is under cursor", buffer = bufnr})
keymap.set("n", "<leader>dj", vim.diagnostic.goto_next, {desc = "Go to next diagnostic", buffer = bufnr})
keymap.set("n", "<leader>dk", vim.diagnostic.goto_prev, {desc = "Go to previous diagnostic", buffer = bufnr})
keymap.set("n", "<leader>ds", vim.diagnostic.open_float, {desc = "Show diagnostic", buffer = bufnr})
keymap.set("n", "dl", "<cmd>Telescope diagnostics<CR>", {desc = "Diagnostic list", buffer = bufnr})
keymap.set("n", "<leader>r", vim.lsp.buf.rename, {desc = "Rename", buffer = bufnr})

-- Start the LSP
require('jdtls').start_or_attach(config)
