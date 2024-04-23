return{
-- lazy.nvim
{
  "folke/noice.nvim",
  event = "VeryLazy",
  config = function ()
    require("noice").setup({
        lsp = {
          hover = {
            enabled =false,
          },
          signature = {
            enabled = false,
          },
        },
    -- add any options here
      })
    end,
  dependencies = {
    -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
    "MunifTanjim/nui.nvim",
    -- OPTIONAL:
    --   `nvim-notify` is only needed, if you want to use the notification view.
    --   If not available, we use `mini` as the fallback
   -- "rcarriga/nvim-notify",
    }
}
}
