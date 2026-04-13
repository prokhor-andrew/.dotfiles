vim.g.mapleader = " "

local function tmux_select_pane(flag)
	if vim.env.TMUX == nil or vim.env.TMUX == "" then
		return
	end

	if vim.system then
		vim.system({ "tmux", "select-pane", flag }, { detach = true })
		return
	end

	vim.fn.jobstart({ "tmux", "select-pane", flag }, { detach = true })
end

local function smart_navigate(dir, tmux_flag)
	local current_win = vim.api.nvim_get_current_win()
	vim.cmd("wincmd " .. dir)

	if vim.api.nvim_get_current_win() == current_win then
		tmux_select_pane(tmux_flag)
	end
end

vim.keymap.set("n", "<leader>j", "<C-d>zz", { silent = true })
vim.keymap.set("n", "<leader>k", "<C-u>zz", { silent = true })

vim.keymap.set("n", "<leader>v", "<C-v>", { noremap = true, silent = true, desc = "Visual block mode" })

vim.keymap.set("n", "<M-j>h", function()
	smart_navigate("h", "-L")
end, { desc = "Go left window or tmux pane" })
vim.keymap.set("n", "<M-j>j", function()
	smart_navigate("j", "-D")
end, { desc = "Go down window or tmux pane" })
vim.keymap.set("n", "<M-j>k", function()
	smart_navigate("k", "-U")
end, { desc = "Go up window or tmux pane" })
vim.keymap.set("n", "<M-j>l", function()
	smart_navigate("l", "-R")
end, { desc = "Go right window or tmux pane" })

vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Definition" })
vim.keymap.set("n", "<leader>[", "<C-o>", { desc = "Jump back" })
vim.keymap.set("n", "<leader>]", "<C-i>", { desc = "Jump forward" })
vim.keymap.set("n", "gr", vim.lsp.buf.references, { desc = "References" })
vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover" })
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename" })
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code action" })
vim.keymap.set("n", "<leader>>", ":vertical resize +5<CR>", { desc = "Widen window" })
vim.keymap.set("n", "<leader><", ":vertical resize -5<CR>", { desc = "Narrow window" })
vim.keymap.set("n", "<CR>", "o<Esc>", { noremap = true, silent = true })
vim.keymap.set("n", "q", "<Nop>")
vim.keymap.set("n", "U", "<C-r>")
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR><Esc>", { noremap = true, silent = true })
--
--
--
--
--
--
--
--
--
--
