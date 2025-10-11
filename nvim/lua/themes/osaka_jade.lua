return {
	{
		"ribru17/bamboo.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("bamboo").setup({
				style = "vulgaris", -- 'vulgaris' is the jade variant
			})
			require("bamboo").load()
		end,
	},
}
