return{
  {
      "lukas-reineke/indent-blankline.nvim",
      enabled = true,
      main = "ibl",
      ---@module "ibl"
      ---@type ibl.config
      opts = {
      },
      config = function ()
          require("ibl").setup({
          enabled = not vim.g.vscode -- 在 vscode 中使用缩进线会显得很奇怪
      })
      end,
  }
}
