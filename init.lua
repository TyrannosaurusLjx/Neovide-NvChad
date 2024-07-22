vim.g.base46_cache = vim.fn.stdpath "data" .. "/nvchad/base46/"
vim.g.mapleader = " "

-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end

vim.opt.rtp:prepend(lazypath)


local lazy_config = require "configs.lazy"

-- 添加 vscode 的配置 (但是还什么都没有,有空再搞吧)
if vim.g.vscode then

else



-- load plugins
require("lazy").setup({
  {
    "NvChad/NvChad",
    lazy = false,
    branch = "v2.5",
    import = "nvchad.plugins",
    config = function()
      require "options"
    end,
  },

  { import = "plugins" },
}, lazy_config)

-- load theme
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

require "nvchad.autocmds"

vim.schedule(function()
  require "mappings"
end)



-- auto_session
vim.o.sessionoptions="blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal"

vim.cmd('set guifont=Hack\\ Nerd\\ Font:h16:i')
vim.cmd("lua require('copilot.suggestion').toggle_auto_trigger()")
vim.cmd("set scrolloff=15")

-- 解决 luasnip 跳转问题
function leave_snippet()
    if
        ((vim.v.event.old_mode == 's' and vim.v.event.new_mode == 'n') or vim.v.event.old_mode == 'i')
        and require('luasnip').session.current_nodes[vim.api.nvim_get_current_buf()]
        and not require('luasnip').session.jump_active
    then
        require('luasnip').unlink_current()
    end
end

-- stop snippets when you leave to normal mode
vim.api.nvim_command([[
    autocmd ModeChanged * lua leave_snippet()
]])

-- 输入法切换
vim.g.im_select_value = 1

-- undo file 
vim.opt.undofile = true
vim.opt.undodir = vim.fn.stdpath('data') .. '/undo'

-- 启用 Neovide 的连字功能
vim.g.neovide_cursor_vfx_mode = "ripple"  -- 选择你喜欢的效果 sonicboom, ripple
vim.g.neovide_font_features = "liga"  -- 启用连字

-- 显示边框
vim.g.neovide_show_border = true

-- 光标闪烁
vim.g.neovide_cursor_smooth_blink = true

-- 启用持久化 undo
vim.opt.undofile = true

-- 设置 undo 文件目录
vim.opt.undodir = os.getenv("HOME") .. "/.config/nvim/undodir"

-- auto-session
vim.o.sessionoptions="blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"

end
