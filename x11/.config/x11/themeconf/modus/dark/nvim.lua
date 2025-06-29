return {
  {
    "miikanissi/modus-themes.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("modus-themes").setup({ line_nr_column_background = false })
      vim.cmd.colorscheme("modus_vivendi")
    end,
  }
}
