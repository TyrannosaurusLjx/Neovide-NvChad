return{
    -- amongst your other plugins
  {
    'akinsho/toggleterm.nvim', version = "*",
    lazy = false,
    config = function ()
      require("toggleterm").setup( {

        open_mapping = [[<c-\>]],
        shade_terminals = false,
        

      } )
    end
  }


}
