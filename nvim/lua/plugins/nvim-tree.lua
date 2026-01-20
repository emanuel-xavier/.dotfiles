return {
  "nvim-tree/nvim-tree.lua",
  config = function()
    require("nvim-tree").setup({
      update_focused_file = {
          enable      = true,
          update_cwd  = false,
          ignore_list = {}
      },
      vim.api.nvim_set_keymap('n', '<leader>e', ':NvimTreeFocus<CR>', { noremap = true, silent = true, desc = 'Focus on file tree' }),
      vim.api.nvim_set_keymap('n', '<leader>ft', ':NvimTreeToggle<CR>', { noremap = true, silent = true, desc = 'Toggle file tree' }),
      view = {
        side = "left",
        width = 40,
      },
      renderer = {
        group_empty = true,
      },
      actions = {
        open_file = {
          quit_on_open = true,
        },
      },
    })
  end
}
