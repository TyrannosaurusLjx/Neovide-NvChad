-- return{
-- -- lazy.nvim
-- {
--   "folke/noice.nvim",
--   enabled = false,
--   event = "VeryLazy",
--   config = function ()
--     require("noice").setup({
--         lsp = {
--           enabled = false,
--           hover = {
--             enabled =false,
--           },
--           signature = {
--             enabled = false,
--           },
--         },
--
--         messages = {
--           enabled = false,
--         },
--
--         popupmenu = {
--           enabled = false,
--         },
--
--         redirect = {
--           enabled = false,
--         },
--         notify = {
--           enabled = false,
--         },
--
--         throttle = 1000/100
--
--
--
--
--
--     -- add any options here
--       })
--     end,
--   dependencies = {
--     -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
--     "MunifTanjim/nui.nvim",
--     -- OPTIONAL:
--     --   `nvim-notify` is only needed, if you want to use the notification view.
--     --   If not available, we use `mini` as the fallback
--    -- "rcarriga/nvim-notify",
--     }
-- }
-- }
--

-- return{
-- {
--   "folke/noice.nvim",
--   enabled = false,
--   event = "VeryLazy",
--   config = function ()
--     require("noice").setup({
--       lsp = {
--         enabled = false,
--         hover = {
--           enabled = false,
--         },
--         signature = {
--           enabled = false,
--         },
--       },
--       messages = {
--         enabled = false,
--       },
--       popupmenu = {
--         enabled = false,
--       },
--       redirect = {
--         enabled = false,
--       },
--       notify = {
--         enabled = false,
--       },
--       throttle = 1000/100
--     })
--   end,
--   dependencies = {
--     "MunifTanjim/nui.nvim",
--     -- OPTIONAL:
--     --   `nvim-notify` is only needed, if you want to use the notification view.
--     --   If not available, we use `mini` as the fallback
--     -- "rcarriga/nvim-notify",
--   }
-- }
-- }


return{
  "folke/noice.nvim",
  event = "VeryLazy",
  opts = {
    -- add any options here
  },
  dependencies = {
    -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
    "MunifTanjim/nui.nvim",
    -- OPTIONAL:
    --   `nvim-notify` is only needed, if you want to use the notification view.
    --   If not available, we use `mini` as the fallback
    -- "rcarriga/nvim-notify",
    },

    config = function ()
      require("noice").setup({

        lsp = {

          progress = {
            enabled = false,
          },

          message = {
            enabled =false,
          },

          signature = {
            enabled = false,
          }
        }



      })
    end
}










