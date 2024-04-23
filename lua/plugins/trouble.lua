return {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    lazy = false,

    config = function ()
      require("trouble").setup({

        position = "right",
        height = 10,
        action_keys = {
          help = "?",
        }

        })
      end
}
