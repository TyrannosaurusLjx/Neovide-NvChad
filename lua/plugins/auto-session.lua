return {
  "rmagatti/auto-session",
  lazy = false,
  opts = {
    suppressed_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
    -- pre_save_cmds = {
    --   function()
    --     local chat = require("CopilotChat")
    --     print("hello")
    --     local file = vim.fn.expand("~/.config/nvim/test/test.txt")
    --     local f = io.open(file, "a")
    --     f:write("hello")
    --     f:close()
    --     chat.close()
    --   end,
    -- },
  },
}
