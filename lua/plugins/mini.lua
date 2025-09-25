local M = {
  {
    "echasnovski/mini.nvim",
    version = "*",
    config = function()
      -- 增强的],[移动
      require("mini.bracketed").setup()
      -- local gen_loader = require("mini.snippets").gen_loader
      -- require("mini.snippets").setup({
      --
      --   -- Module mappings. Use `''` (empty string) to disable one.
      --   mappings = {
      --     -- Expand snippet at cursor position. Created globally in Insert mode.
      --     expand = "<c-tab>",
      --
      --     -- Interact with default `expand.insert` session.
      --     -- Created for the duration of active session(s)
      --     jump_next = "<D-f>",
      --     jump_prev = "<D-b>",
      --     stop = "<C-c>",
      --   },
      --
      --   snippets = {
      --     -- Load custom file with global snippets first (adjust for Windows)
      --     gen_loader.from_file("~/.config/nvim/snippets/global.json"),
      --
      --     -- Load snippets based on current language by reading files from
      --     -- "snippets/" subdirectories from 'runtimepath' directories.
      --     gen_loader.from_lang(),
      --   },
      -- })

      require("mini.icons").setup({
        file = {
          [".eslintrc.js"] = { glyph = "󰱺", hl = "MiniIconsYellow" },
          [".node-version"] = { glyph = "", hl = "MiniIconsGreen" },
          [".prettierrc"] = { glyph = "", hl = "MiniIconsPurple" },
          [".yarnrc.yml"] = { glyph = "", hl = "MiniIconsBlue" },
          ["eslint.config.js"] = { glyph = "󰱺", hl = "MiniIconsYellow" },
          ["package.json"] = { glyph = "", hl = "MiniIconsGreen" },
          ["tsconfig.json"] = { glyph = "", hl = "MiniIconsAzure" },
          ["tsconfig.build.json"] = { glyph = "", hl = "MiniIconsAzure" },
          ["yarn.lock"] = { glyph = "", hl = "MiniIconsBlue" },
        },
      })

      require("mini.ai").setup()
    end,
  },
}

return M
