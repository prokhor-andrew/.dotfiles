return {
    'nvim-treesitter/nvim-treesitter',
    lazy = false,
    build = ":TSUpdate",
    config = function()
        local configs = require("nvim-treesitter")
        configs.setup({
            highlight = {
	        enable = true,
	    },
	    indent = { enable = true },
	    autotage = { enable = true },
	    ensure_installed = {
	        "lua",
		"markdown",
		"markdown_inline",
		"tsx",
		"typescript",
		"dart",
	    },
	    auto_install = false,
	})
    end
}
