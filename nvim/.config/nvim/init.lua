vim.g.loaded_perl_provider = 0
local _ruby_host = vim.fn.exepath("neovim-ruby-host")
if _ruby_host ~= "" then vim.g.ruby_host_prog = _ruby_host end
require("config.options")
require("config.keybinds")
require("config.lazy")
