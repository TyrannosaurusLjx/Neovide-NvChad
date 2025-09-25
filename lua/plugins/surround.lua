local M = {
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    -- config = function()
    --   require("nvim-surround").setup({
    --     -- Configuration here, or leave empty to use defaults
    --
    --   })
    -- end,
    opts = {
      keymaps = {
        insert = "<C-g>s",
        insert_line = "<C-g>S",
        normal = "gys",
        normal_cur = "gySS",
        normal_line = "gyS",
        normal_cur_line = "gySS",
        visual = "gys",
        visual_line = "gyS",
        delete = "gds",
        change = "gcs",
        change_line = "gcS",
      },
    },
  },
}

return M
