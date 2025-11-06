return {
  'folke/which-key.nvim',
  event = 'VimEnter',
  dependencies = {
    'echasnovski/mini.icons',
  },
  config = function()
    -- gain access to the which key plugin
    local which_key = require('which-key')

    -- call the setup function with default properties
    which_key.setup({
      spec = {
        { "<leader>J", group = "Java" },
      }
    })
  end
}
