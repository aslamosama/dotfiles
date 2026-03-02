require("yaziline"):setup({
  -- color = "98c379",
  -- secondary_color = "#5A6078",
  -- default_files_color = "darkgray", -- color of the file counter when it's inactive
  -- selected_files_color = "white",
  -- yanked_files_color = "green",
  -- cut_files_color = "red",

  separator_style = "empty", -- "angly" | "curvy" | "liney" | "empty"
  separator_open = "",
  separator_close = "",
  separator_open_thin = "",
  separator_close_thin = "",
  separator_head = "",
  separator_tail = "",

  select_symbol = "",
  yank_symbol = "󰆐",

  filename_max_length = 24, -- truncate when filename > 24
  filename_truncate_length = 6, -- leave 6 chars on both sides
  filename_truncate_separator = "..."
})
require("smart-enter"):setup {
	open_multi = true,
}
