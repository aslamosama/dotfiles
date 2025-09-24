return {
  {
    "miikanissi/modus-themes.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("modus-themes").setup({
        line_nr_column_background = true,
        dim_inactive = false,
        on_highlights = function(highlights)
          local white            = "#ffffff"
          highlights.NormalFloat = { bg = white }
        end,
      })
      vim.cmd.colorscheme("modus_operandi")
    end,
  }
}
