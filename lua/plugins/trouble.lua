return {
  {
    "folke/trouble.nvim",
    -- opts = {
      cmd = "Trouble",
      config = function()
        require("trouble").setup({
          -- Filters to only show errors
          filters = {
            error = true,
            warning = false,
            hint = false,
            information = false,
          },
        })
      end,
    -- },
  }
}
