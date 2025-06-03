return {
  "ellisonleao/gruvbox.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    vim.opt.background = "light"
    require("gruvbox").setup({
      overrides = {
        SignColumn = { bg = "#FBF1C7" }
      }
    })
    vim.cmd.colorscheme "gruvbox"
  end
}
