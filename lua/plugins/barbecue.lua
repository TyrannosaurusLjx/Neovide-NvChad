return{
    {
        "utilyre/barbecue.nvim",
        name = "barbecue",
        lazy = false,
        version = "*",
        -- 顶部的面包屑导航是一直需要的
        dependencies = {
          "SmiteshP/nvim-navic",
          "nvim-tree/nvim-web-devicons", -- optional dependency
        },
        config = function ()
            require("barbecue").setup({
            })
        end
      }
}
