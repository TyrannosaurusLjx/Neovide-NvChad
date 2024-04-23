if true then return {} end

return{
  "nvim-treesitter/nvim-treesitter",
  enabled =false,
  config = function ()
    require("lazy").setup({{
      "nvim-treesitter/nvim-treesitter",
      build = ":TSUpdate",
      config = function () 
        local configs = require("nvim-treesitter.configs")
        configs.setup({
            ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "elixir", "heex", "javascript", "html", "python", "markdown" },
            sync_install = true,
            highlight = { enable = true},
            indent = { enable = true },
          })
      end
      }})
  end
}
