return {
  "nvim-tree/nvim-tree.lua",
  config = function()
    require("nvim-tree").setup({
      vim.api.nvim_set_keymap('n', '<leader>e', ':NvimTreeFocus<CR>', { noremap = true, silent = true }),
      vim.api.nvim_set_keymap('n', '<leader>ft', ':NvimTreeToggle<CR>', { noremap = true, silent = true }),
    }) 
  end
}
