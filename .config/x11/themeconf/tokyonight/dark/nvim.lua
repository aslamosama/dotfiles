return {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("tokyonight").setup({
        transparent = false,
        day_brightness = 0.1,
        styles = {
          comments = { italic = true },
          keywords = { italic = true },
          functions = {},
          variables = {},
          sidebars = "normal",
          floats = "normal"
        },
      })
      vim.cmd.colorscheme("tokyonight-night")
    end,
  }
}
