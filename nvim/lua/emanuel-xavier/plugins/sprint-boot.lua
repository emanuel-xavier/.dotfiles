return {
  "JavaHello/spring-boot.nvim",
  ft = {"java", "yaml", "jproperties"},
  lazy = true,
  dependencies = {
    'nvim-java/nvim-java',
    'neovim/nvim-lspconfig',
  }
}
