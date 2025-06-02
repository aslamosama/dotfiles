-- lua/plugins/rose-pine.lua
return {
	"rose-pine/neovim",
  lazy = false,
  priority = 1000,
	name = "rose-pine",
	config = function()
		vim.cmd("colorscheme rose-pine-main")
	end
}
