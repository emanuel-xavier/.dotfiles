return {
  'folke/which-key.nvim',
  event = 'VimEnter',
  config = function()
    -- gain access to the which key plugin
    local which_key = require('which-key')

    -- call the setup function with default properties
    which_key.setup()

    -- Register prefixes for the different key mappings we have setup previously
    which_key.register({
        -- ['<leader>g'] = { name = '[G]it', _ = 'which_key_ignore' },
        ['<leader>J'] = { name = '[J]ava', _ = 'which_key_ignore' },
    })
  end
}
