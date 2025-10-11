return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		lazy = false,
		priority = 1000,
		config = function()
			require("catppuccin").setup({
				flavour = "latte", -- other options: "mocha", "frappe", "macchiato"
			})
			vim.cmd.colorscheme("catppuccin-latte")
		end,
	},
}
