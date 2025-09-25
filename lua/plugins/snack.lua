local dashboard = {
  enable = true,
  formats = {
    key = function(item)
      return { { "[", hl = "special" }, { item.key, hl = "key" }, { "]", hl = "special" } }
    end,
  },
  sections = {
    -- { section = "terminal", cmd = "fortune -s | cowsay", hl = "header", padding = 1, indent = 8 },
    { title = "MRU", padding = 1 },
    { section = "recent_files", limit = 8, padding = 1 },
    { title = "MRU ", file = vim.fn.fnamemodify(".", ":~"), padding = 1 },
    { section = "recent_files", cwd = true, limit = 8, padding = 1 },
    { title = "Sessions", padding = 1 },
    { section = "projects", padding = 1 },
    { title = "Bookmarks", padding = 1 },
    { section = "keys" },
  },
}
local picker = {
  enabled = true,
  win = {
    input = {
      keys = {
        ["<D-j>"] = { "toggle_focus", mode = { "i", "n" } },
      },
    },
    list = {
      keys = {
        ["<D-k>"] = { "toggle_focus", mode = { "i", "n" } },
        ["<D-j>"] = "list_down",
      },
    },
  },
  layout = {
    layout = {
      box = "vertical",
      backdrop = false,
      row = -1,
      width = 0,
      height = 0.4,
      border = "top",
      title = " {title} {live} {flags}",
      title_pos = "left",
      { win = "input", height = 1, border = "bottom" },
      {
        box = "horizontal",
        { win = "list", border = "none" },
        { win = "preview", title = "{preview}", width = 0.6, border = "left" },
      },
    },
  },
}

local M = {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
    bigfile = { enabled = true },
    dashboard = dashboard,
    explorer = { enabled = true },
    indent = { enabled = true },
    input = { enabled = true },
    notifier = {
      enabled = true,
    },
    picker = picker,
    quickfile = { enabled = true },
    scope = { enabled = true },
    scroll = { enabled = true },
    statuscolumn = { enabled = true },
    words = { enabled = true },
    terminal = {
      enabled = true,
      -- win = { position = "float" },
    },
    layout = {
      width = 0.6,
      height = 0.6,
      zindex = 50,
    },
  },
}
return M
