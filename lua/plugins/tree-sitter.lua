-- return{
--   "nvim-treesitter/nvim-treesitter",
--   lazy =false,
--   enabled =true,
--   config = function ()
--     require("lazy").setup({
--       "nvim-treesitter/nvim-treesitter",
--       build = ":TSUpdate",
--       config = function ()
--         local configs = require("nvim-treesitter.configs")
--         configs.setup({
--             ensure_installed = {"latex" , "ltex-ls" ,"c", "lua", "vim", "vimdoc", "query", "elixir", "heex", "javascript", "html", "python", "markdown" },
--             sync_install = true,
--             highlight = { enable = true},
--             indent = { enable = true },
--           })
--       end
--       })
--   end
-- }

return{

  'nvim-treesitter/nvim-treesitter',
  lazy = false,
  config = function ()
    require("nvim-treesitter.configs").setup({

      ensure_installed = {"c", "latex", "lua", "vim", "javascript", "html", "python", "markdown"},
      -- sync_install = true,
      -- auto_install = true,
      highlight = {
        enable = true,

      },
    })
  end


}
