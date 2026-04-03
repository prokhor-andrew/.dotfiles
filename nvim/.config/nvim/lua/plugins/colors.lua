return {
    {
	"sainnhe/gruvbox-material",
	config = function()
	    vim.g.gruvbox_material_enable_italic = 1
	    vim.g.gruvbox_material_better_performance = 1

	    vim.cmd.colorscheme("gruvbox-material")
	end,
    },
    {
	"nvim-lualine/lualine.nvim",
	dependencies = {
	    "nvim-tree/nvim-web-devicons", 
	},
	opts = { 
	    theme = "gruvbox-material", 
	} 
    },
} 
