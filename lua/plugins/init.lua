return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    config = function()
      require "configs.conform"
    end,
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },

  {
  	"williamboman/mason.nvim",
  	opts = {
  		ensure_installed = {
  			"stylua",
  			"html-lsp", "css-lsp" , "prettier",
        "pyright"
  		},
  	},
  },

  -- {
  -- 	"nvim-treesitter/nvim-treesitter",
  -- 	opts = {
  -- 		ensure_installed = {
  -- 			"vim", "lua", "vimdoc",
  --      "html", "css"
  -- 		},
  -- 	},
  -- },
  -- bookmarks
  {
      'crusj/bookmarks.nvim',
      keys = {
          -- { "<leader>", mode = { "n" } },
      },
      branch = 'main',
      dependencies = { 'nvim-web-devicons' },
      config = function()
          require("bookmarks").setup()
          require("telescope").load_extension("bookmarks")
      end
  },
  -- session
  {
    'rmagatti/auto-session',
    lazy = false,
    config = function()
      local opts = {
       auto_session_enable_last_session = false,
       auto_session_root_dir = vim.fn.stdpath('data').."/sessions/",
       auto_session_enabled = true,
       auto_save_enabled = true,
       auto_restore_enabled = false,
       log_level = "error",
       auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/"},
     }
      require("auto-session").setup(opts)
    end,
  },
 --  {
 --  'rmagatti/session-lens',
 --  requires = {'rmagatti/auto-session', 'nvim-telescope/telescope.nvim'},
 --  config = function()
 --    require('session-lens').setup({--[[your custom config--]]})
 --  end
 -- },
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    build = ":Copilot auth",
    opts = {
      suggestion = { enabled = true,
        -- keymap = {
        --   accept = ">",
        --   -- 其他键盘快捷键
        -- }
      },
      panel = { enabled = false },
      filetypes = {
        markdown = true,
        python = true,
        help = true,
      },
    },
  },
  -- markdown previer
  {
    "iamcco/markdown-preview.nvim",
    build = function() vim.fn["mkdp#util#install"]() end,
    init = function()
      vim.g.mkdp_filetypes = { "markdown" }
      vim.g.mkdp_browser = "vivaldi"
    end,
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
  },
  -- image paste
-- markdown image paste
  {
   'img-paste-devs/img-paste.vim',
    lazy = false,
  },
  {
    'goolord/alpha-nvim',
    config = function ()
        require'alpha'.setup(require'alpha.themes.dashboard'.config)
    end
 },
 {
      "vhyrro/luarocks.nvim",
      priority = 1001, -- this plugin needs to run before anything else
      opts = {
          rocks = { "magick" },
      },
  },
  {
      "3rd/image.nvim",
      dependencies = { "luarocks.nvim" },
      config = function()
          require("image").setup({})-- ...
      end
  }
}


