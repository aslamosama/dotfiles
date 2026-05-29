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

require("bunny"):setup({
  hops = {
    { key = "/",          path = "/",                                    },
    { key = "h",          path = "~",              desc = "Home"         },
    { key = "c",          path = "/mnt/c",         desc = "C Drive"      },
    { key = "d",          path = "/mnt/d",         desc = "D Drive"      },
    { key = "C",          path = "~/.config",      desc = "Config files" },
    { key = { "l", "s" }, path = "~/.local/share", desc = "Local share"  },
    { key = { "l", "b" }, path = "~/.local/bin",   desc = "Local bin"    },
    -- key and path attributes are required, desc is optional
  },
  desc_strategy = "path", -- If desc isn't present, use "path" or "filename", default is "path"
  ephemeral = true, -- Enable ephemeral hops, default is true
  tabs = true, -- Enable tab hops, default is true
  notify = false, -- Notify after hopping, default is false
  fuzzy_cmd = "fzf", -- Fuzzy searching command, default is "fzf"
})

require("session"):setup {
	sync_yanked = true,
}
