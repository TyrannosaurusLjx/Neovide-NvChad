return{
  -- {
  --   "natecraddock/sessions.nvim",
  --   lazy = false,
  --   config = function ()
  --     require("sessions").setup({
  --         events = { "BufEnter" },
  --         session_filepath = vim.fn.stdpath("data") .. "/sessions",
  --         absolute = true,
  --       })
  --   end
  -- }
  {
    'rmagatti/auto-session',
    lazy = true,
    config = function()
      local opts = {
       auto_session_enable_last_session = true,
       auto_session_root_dir = vim.fn.stdpath('data').."/sessions/",
       auto_session_enabled = true,
       auto_save_enabled = true,
       auto_restore_enabled = true,
       log_level = "error",
       auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/"},
     }
      require("auto-session").setup(opts)
    end,
  }

}
