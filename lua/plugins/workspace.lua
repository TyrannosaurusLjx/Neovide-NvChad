return{
  {
    "natecraddock/workspaces.nvim",
    config = function ()
     require("workspaces").setup({
      hooks = {
        open = {
          -- "SessionRestore",
          "NvimTreeToggle",
        }
      }
    })
    end
  }
}
