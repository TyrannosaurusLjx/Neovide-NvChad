require "nvchad.options"

-- add yours here!

-- local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!
local font_size = 17
local font = "JetBrainsMono Nerd Font:h" .. font_size .. ":#h-none"
vim.o.guifont = font
local function zoom(i)
  font_size = font_size + i
  vim.o.guifont = "JetBrainsMono Nerd Font:h" .. font_size .. ":#h-none"
end
vim.keymap.set("n", "<D-=>", function()
  zoom(1)
end)
vim.keymap.set("n", "<D-->", function()
  zoom(-1)
end)
vim.opt.pumheight = 10
