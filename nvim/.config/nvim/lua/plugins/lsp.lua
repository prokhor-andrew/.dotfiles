return {
	{
		"mason-org/mason.nvim",
		opts = {},
	},
	{
		"mason-org/mason-lspconfig.nvim",
		dependencies = {
			{ "mason-org/mason.nvim" },
			{ "neovim/nvim-lspconfig" },
		},
		opts = {
			ensure_installed = { "bashls", "lua_ls", "ts_ls", "dartls", "jsonls", "postgres_lsp" },
			automatic_enable = true,
		},
	},
	{
		"neovim/nvim-lspconfig",
	},
}
