return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		require("neo-tree").setup({
			enable_git_status = true,
			filesystem = {
				follow_current_file = {
					enabled = true,
				},
				hijack_netrw_behavior = "open_default",
				use_libuv_file_watcher = true,
			},
			window = {
				position = "left",
				width = 30,
				mappings = {
					["/"] = "filter_on_submit",
					["f"] = "filter_as_you_type",
				},
			},
			default_component_configs = {
				git_status = {
					symbols = {
						added = "A",
						modified = "M",
						deleted = "D",
						renamed = "R",
						untracked = "U",
						ignored = "I",
						unstaged = "*",
						staged = "S",
						conflict = "!",
					},
				},
			},
		})

		local refresh_neotree = function()
			local ok, manager = pcall(require, "neo-tree.sources.manager")
			if not ok then
				return
			end

			manager.refresh("filesystem")
			manager.refresh("git_status")
		end

		local group = vim.api.nvim_create_augroup("NeoTreeAutoRefresh", { clear = true })
		vim.api.nvim_create_autocmd({ "FocusGained", "TermClose", "ShellCmdPost", "DirChanged" }, {
			group = group,
			callback = function()
				vim.schedule(refresh_neotree)
			end,
		})
	end,
	lazy = false,
	keys = {
		{ "<leader>e", "<cmd>Neotree toggle left<cr>", desc = "Explorer" },
	},
}
