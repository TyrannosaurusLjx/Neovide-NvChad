vim.g.base46_cache = vim.fn.stdpath("data") .. "/nvchad/base46/"

--设置 lazy
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  ---------------surround---------------

  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    -- config = function()
    --   require("nvim-surround").setup({
    --     -- Configuration here, or leave empty to use defaults
    --
    --   })
    -- end,
    opts = {
      keymaps = {
        insert = "<C-g>s",
        insert_line = "<C-g>S",
        normal = "gys",
        normal_cur = "gySS",
        normal_line = "gyS",
        normal_cur_line = "gySS",
        visual = "gys",
        visual_line = "gyS",
        delete = "gds",
        change = "gcs",
        change_line = "gcS",
      },
    },
  },

  ---------------flash---------------
  {
    "folke/flash.nvim",
    -- event = "VeryLazy",
    opts = {},
  },
  {
    "monaqa/dial.nvim",
  },

    --------------- Treesitter & Text Objects ---------------
    {
        -- 核心依赖：nvim-treesitter
        "nvim-treesitter/nvim-treesitter",
        -- 启用/配置 Text Objects 的关键步骤
        build = ":TSUpdate", -- 确保安装解析器
        config = function()
            require("nvim-treesitter.configs").setup {
                -- 确保安装了您需要的语言解析器
                ensure_installed = { "c", "lua", "javascript", "typescript", "python", "html", "css", "vim" },
                highlight = { enable = true },
                indent = { enable = true },
                -- 添加 Treesitter Text Objects 配置
                textobjects = {
                    select = {
                        enable = true,
                        lookahead = true,
                        keymaps = {
                            -- 映射：vaf 选中整个函数，vif 选中函数内部
                            ['af'] = '@function.outer',
                            ['if'] = '@function.inner',
                            ['ac'] = '@class.outer',
                            ['ic'] = '@class.inner',
                        },
                    },
                    -- 确保 Text Objects 的重复移动也启用
                    move = {
                        enable = true,
                        set_jumps = true,
                        goto_next_start = { ["]f"] = "@function.outer", ["]]"] = "@class.outer" },
                        goto_next_end = { ["]F"] = "@function.outer", ["]["] = "@class.outer" },
                        goto_previous_start = { ["[f"] = "@function.outer", ["[["] = "@class.outer" },
                        goto_previous_end = { ["[F"] = "@function.outer", ["[]"] = "@class.outer" },
                    },
                },
            }
        end,
    },
    
    {
        -- Text Objects 扩展
        "nvim-treesitter/nvim-treesitter-textobjects",
    },
})

----------options----------
--设置系统剪切板和 neovim 剪切板同步
vim.opt.clipboard = "unnamedplus"

----------keymap----------
local map = vim.keymap.set
local vscode = require("vscode")
local function keymap(mode, lhs, rhs)
  vim.keymap.set(mode, lhs, function()
    vscode.call(rhs)
  end, { silent = true, noremap = true })
end
-- map("n", "<Space>", "", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "
-- flash
map({ "n", "x", "o" }, "s", "<CMD>lua require('flash').jump() <CR>")
map({ "n", "x", "o" }, "S", "<CMD>lua require('flash').treesitter() <CR>")

--移动
map({ "n", "v" }, ";", ":", { desc = "CMD enter command mode" })
map({ "n", "v" }, "J", "5j")
map({ "n", "v" }, "K", "5k")
map({ "n", "v" }, "L", "$")
map({ "n", "v" }, "H", "^")
map("n", ";", ":")
map("i", ",", ",<c-g>u")
map("i", ".", ".<c-g>u")
map("i", ";", ";<c-g>u")
map("i", "<CR>", "<CR><C-g>u")
map("n", "+", function()
  require("dial.map").manipulate("increment", "normal")
end)
map("n", "-", function()
  require("dial.map").manipulate("decrement", "normal")
end)
map("n", "<enter>", "ciw")

-- keymap("n", "<leader>nT", "foam-vscode.open-daily-note-for-date")
-- keymap("n", "<leader>nt", "foam-vscode.open-daily-note")
keymap("n", "<leader>nf", "workbench.action.quickOpen")
keymap("n", "zM", "editor.foldAll")
keymap("n", "zR", "editor.unfoldAll")
keymap("n", "zc", "editor.fold")
keymap("n", "zC", "editor.foldRecursively")
keymap("n", "zo", "editor.unfold")
keymap("n", "zO", "editor.unfoldRecursively")
keymap("n", "za", "editor.toggleFold")
keymap("n", "<leader>ff", "workbench.action.quickTextSearch")
keymap("n", "<leader>fF", "workbench.action.findInFiles")
keymap("n", "<leader>fo", "workbench.action.openRecent")
keymap("n", "<leader>bb", "workbench.action.openPreviousRecentlyUsedEditor")


local ts_repeat_move = require "nvim-treesitter.textobjects.repeatable_move"
-- Repeat movement with ; and ,
-- ensure ; goes forward and , goes backward regardless of the last direction
vim.keymap.set({ "n", "x", "o" }, ";", ts_repeat_move.repeat_last_move_next)
vim.keymap.set({ "n", "x", "o" }, ",", ts_repeat_move.repeat_last_move_previous)

-- vim way: ; goes to the direction you were moving.
-- vim.keymap.set({ "n", "x", "o" }, ";", ts_repeat_move.repeat_last_move)
-- vim.keymap.set({ "n", "x", "o" }, ",", ts_repeat_move.repeat_last_move_opposite)

-- Optionally, make builtin f, F, t, T also repeatable with ; and ,
vim.keymap.set({ "n", "x", "o" }, "f", ts_repeat_move.builtin_f_expr, { expr = true })
vim.keymap.set({ "n", "x", "o" }, "F", ts_repeat_move.builtin_F_expr, { expr = true })
vim.keymap.set({ "n", "x", "o" }, "t", ts_repeat_move.builtin_t_expr, { expr = true })
vim.keymap.set({ "n", "x", "o" }, "T", ts_repeat_move.builtin_T_expr, { expr = true })
