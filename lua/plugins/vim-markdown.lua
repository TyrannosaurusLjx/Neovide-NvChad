return{
  "godlygeek/tabular",
  "preservim/vim-markdown",

  Lazy = false,
  config = function ()
    require("vim-markdown").setup()
  end
}
