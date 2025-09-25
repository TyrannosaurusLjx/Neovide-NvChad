return {
  "folke/styler.nvim",
  enabled = false,
  config = function()
    require("styler").setup({
      themes = {
        copilot_chat = { colorscheme = "vim" },
      },
    })
  end,
}
