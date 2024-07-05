require "nvchad.mappings"
--Nvchad 映射文件
--https://github.com/NvChad/NvChad/blob/v2.5/lua/nvchad/mappings.lua

-- add yours here
local map = vim.keymap.set
local nomap = vim.keymap.del


map("n", ";", ":", { desc = "CMD enter command mode" })

-- 命令模式下粘贴
-- https://stackoverflow.com/questions/3997078/how-to-paste-yanked-text-into-the-vim-command-line
map("c", "<D-v>", "<C-r>+")
-- 终端接受补全
map("t", "<F12>", "<Right>")
map("t", "<D-F12>", "<C-Right>")
-- 命令模式下上下
map("c", "<D-j>", "<Down>")
map("c", "<D-k>", "<Up>")
-- 命令模式下左右
map("c", "<D-h>", "<Left>")
map("c", "<D-l>", "<Right>")


map("i", "jk", "<ESC>:!/opt/homebrew/bin/im-select com.apple.keylayout.ABC<CR>",{noremap = true,silent = true})
map("i", "<ESC>", "<ESC>:!/opt/homebrew/bin/im-select com.apple.keylayout.ABC<CR>",{noremap = true,silent = true})

-- 移动映射
map("n", "j", "jzz")
map("n", "k", "kzz")
map("i", "<D-j>", "<Down>")
map("i", "<D-k>", "<Up>")
map("i", "<D-h>", "<Left>")
map("i", "<D-l>", "<Right>")
map("n", "<D-j>", "3<Down>")
map("n", "<D-k>", "3<Up>")
map("n", "<D-h>", "3<Left>")
map("n", "<D-l>", "3<Right>")
map("i", "<D-]>", "<ESC>2ea")
map("i", "<D-[>", "<ESC>2gea")
map("v", "<D-j>", "<Down>")

map("n", "K", "<C-b>")
map("n", "J", "<C-f>")
map("n", "H", "0")
map("n", "L", "$")


-- map("v", "<D-k>", "<Up>")
-- map("v", "<D-h>", "<Left>")
-- map("v", "<D-l>", "<Right>")

-- 复制
-- map("i", "<D-L>", "<ESC>l<C-v>")
-- map("i", "<D-K>", "<ESC>Vk")
-- map("i", "<D-H>", "<ESC><C-v>")
-- map("i", "<D-J>", "<ESC>V")
-- map("v", "<D-L>", "2l")
-- map("v", "<D-K>", "k")
-- map("v", "<D-H>", "2h")
-- map("v", "<D-J>", "j")

-- 向后删除
map("i", "<D-backspace>", "<Right><backspace>")

-- 新建一行
map("i", "<D-CR>", "<ESC>o")


-- force write
map("i", "<D-s>", "<ESC>:w<CR>",{noremap = true,silent = true})
map("n", "<D-s>", "<ESC>:w<CR>",{noremap = true,silent = true})

-- force quite
-- map("n", "<D-q>", "<ESC>:wq<CR>")

-- clear search
map("n", "//", "<ESC>:noh<CR>")


-- New file
map("n", "<leader>n", ":n ")
-- open file
map("n", "<D-o>", ':Triptych<CR>', { silent = true })
map("n", "<D-O>", ":tcd ")

-- buffer close
-- map("i", "<D-w>", "<ESC>:bd<CR>")
-- map("n", "<D-w>", "<ESC>:bd<CR>")
-- map("i", "<D-w>", "<ESC>w<CR><CMD>lua require('bufdelete').bufdelete(0, true)<CR>",{noremap = true,silent = true})
map("n", "<D-w>", "<ESC>w<CMD>lua require('bufdelete').bufdelete(0, true)<CR>",{noremap = true,silent = true})


-- new window(tab)
-- map("i", "<D-n>", "<ESC>:tabnew<CR>")
-- map("n", "<D-n>", "<ESC>:tabnew<CR>")

-- new buffer
-- map("i", "<D-t>", "<ESC>:enew<CR>")
-- map("n", "<D-t>", "<ESC>:enew<CR>")



-- nav buffer
-- map("i", "<D-]>", "<ESC>:bnext<CR>",  { noremap = true, silent = true })
-- map("i", "<D-[>", "<ESC>:bprevious<CR>")
map("n", "<D-]>", "<ESC>:bnext<CR>",{silent=true})
map("n", "<D-[>", "<ESC>:bprevious<CR>",{silent=true})

for i = 1, 9, 1 do
  map("n", string.format("<D-%s>", i), function()
    vim.api.nvim_set_current_buf(vim.t.bufs[i])
  end)
end

-- nav split
-- map("i", "<D-{>", "<ESC><C-w>p")
map("n", "<D-}>", "<ESC><C-w><C-w>",{silent=true})
map("n", "<D-{>", "<ESC><C-w>p",{silent=true})

-- comment
map("n", "<D-/>", function()
  require("Comment.api").toggle.linewise.current()
end, { desc = "Comment Toggle" })

map(
  "v",
  "<D-/>",
  "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
  { desc = "Comment Toggle" }
)

-- nvimtree
map("n", "<D-e>", "<cmd>NvimTreeToggle<CR>", { desc = "Nvimtree Toggle window" })
map("n", "<D-E>", "<CMD>Telescope buffers<CR>")

-- terminal
map("n", "<D-t>", function()
  require("nvchad.term").toggle { pos = "float", size = 0.3 }
end, { desc = "Creat Float Terminal" })

map("n", "<C-`>", function()
  require("nvchad.term").toggle { pos = "sp" , size = 0.25 }
end, { desc = "Creat horizon Terminal" })

-- 隐藏 terminal,关闭的话就 exit
map("t", "<ESC>",function ()
  vim.api.nvim_input('<C-\\><C-N>')
  require('nvchad.tabufline').close_buffer()
end,{noremap = true, silent = true})

-- search
-- map("i", "<D-f>", "<ESC>/")
-- map("n", "<D-f>", "<ESC>/")
-- 用 Telescope
map("n", "<D-f>", function ()
  vim.cmd(":Telescope current_buffer_fuzzy_find")
end)


map("n", "<D-F>", "<CMD>Telescope live_grep<CR>")



-- undo
map("i", "<D-z>", "<CMD>:undo<CR>",{silent=true})
map("i", "<D-Z>", "<CMD>:redo<CR>",{silent=true})
map("n", "<D-z>", "<CMD>:undo<CR>",{silent=true})
map("n", "<D-Z>", "<CMD>:redo<CR>",{silent=true})

-- copy and paste


map("i", "<D-v>", function ()
  -- 检查剪贴板内容是否为图片
  local function is_clipboard_image()
      -- 使用 pbpaste 获取剪贴板内容并存储在临时文件中
      local tmp_file = "/tmp/nvim_clipboard_content"
      os.execute('pbpaste > ' .. tmp_file)
      -- 使用 file 命令检查文件类型
      local handle = io.popen('file ' .. tmp_file)
      local result = handle:read("*a")
      handle:close()
      -- 判断文件类型是否为图片
      if result:match("text") then
          return false
      else
          return true
      end
  end

  if is_clipboard_image() then
    vim.cmd(":call mdip#MarkdownClipboardImage()")
  else
    vim.api.nvim_input("<ESC>p")
  end

end)

-- map("i", "<D-v>", "<C-r>+")
map("n", "<D-v>", "<ESC>p")
map("v", "<D-c>", "y")
-- 显示 registers
-- map("i","<D-r>","<CMD>lua require('telescope.builtin').registers(require('telescope.themes').get_cursor())<CR>")
map("i", "<D-r>" , function ()
  vim.api.nvim_input("<C-r>")
end)


-- select all
map("i", "<D-a>", "<ESC>ggVG")
map("n", "<D-a>", "<ESC>ggVG")

-- bookmark https://github.com/crusj/bookmarks.nvim
map("n", "m", "<CMD>lua require'bookmarks'.add_bookmarks(true)<CR>")
map("n", "<leader>m", "<CMD>lua require'bookmarks'.toggle_bookmarks()<CR>")


-- Telescope
map("n", "<D-r>", "<cmd>Telescope oldfiles<CR>", { desc = "Telescope Find oldfiles" })

-- Session
map('n', '<D-R>', '<cmd>lua require("auto-session.session-lens").search_session()<CR>', { noremap = true, silent = true })

-- MarkdownPreview
-- map('n', "<F8>", "<ESC>:MarkdownPreview<CR>")
map("v", "<D-b>", "s****<ESC>hP",{noremap = true,silent = true})
-- map('n', '<F8>', '<cmd>lua if vim.bo.filetype == "markdown" then vim.cmd(":MarkdownPreview") end<CR>', { noremap = true, silent = true })

map("n", "<leader>mp",":RenderMarkdownToggle<CR>")


-- latex编译
-- vim.fn.expand('%:p:r') .. ".pdf"
map('n', '<F8>',function()
  -- 绝对名
  -- 父目录
  local fileDirectory = vim.fn.expand('%:p:h')
  -- 文件名
  -- local filename = vim.fn.fnamemodify(vim.fn.expand('%:p'), ":t:r")
  --编译到当前目录下
  local cmd = string.format("w| !xelatex -output-directory=%s %s",fileDirectory, vim.fn.expand('%:p'))
  -- 编译
  if vim.bo.filetype == "markdown" then
    vim.cmd(":MarkdownPreview")
  elseif vim.bo.filetype == "tex" then
    vim.cmd(cmd)
  else
    print("Unknown file type")
  end
end, { noremap = true, silent = true }
)

-- -- map $ 但是插入两个 $$ 的时候也没用
-- map("i", "$", function ()
--   -- local en = "com.tencent.inputmethod.wetype.pinyin"
--   -- local zh = "com.apple.keylayout.ABC"
--   -- local line = vim.fn.line('.') -- 行
--   -- local col = vim.fn.col('.') -- 列
--   -- local pre_char = string.sub(line,col-1,col-1)
--   -- local pre_char_2 = string.sub(line,col-2,col-2)

--   -- local isEn = false

--   -- if string.match(pre_char_2, "[a-zA-Z]") then
--   --   isEn = true
--   -- else
--   --   isEn = false
--   -- end

--   -- if isEn then  
--   --   -- 不执行任何操作  
--   -- else  
--   --   if pre_char == " " then  
--   --     vim.cmd("!im-select " .. en)  
--   --   end  
--   -- end  

--   -- vim.api.nvim_feedkeys("$", "n", true)
--   if vim.g.im_select_value == 1 then
--     vim.cmd("!/opt/homebrew/bin/im-select com.tencent.inputmethod.wetype.pinyin")
--     vim.g.im_select_value = 2
--   else
--     vim.cmd("!/opt/homebrew/bin/im-select com.apple.keylayout.ABC")
--     vim.g.im_select_value = 1
--   end
--   vim.api.nvim_feedkeys("$", "n", true)

-- end,{noremsap = true,silent = true})

-- markdown image paste
-- map("n", "<c-p>","<ESC>:call mdip#MarkdownClipboardImage()<CR><ESC>",{noremap = true,silent = true})
-- map("i", "<c-p>","<ESC>:call mdip#MarkdownClipboardImage()<CR><ESC>",{noremap = true,silent = true})

-- copilot.lua accept
map("i", "<F12>", '<cmd>lua require("copilot.suggestion").accept()<CR>',{noremap = true,silent = true})
map("i", "<D-F12>", '<cmd>lua require("copilot.suggestion").accept_word()<CR>',{noremap = true,silent = true})
map("i", "<D-m>", '<cmd>lua require("copilot.suggestion").accept_word()<CR>',{noremap = true,silent = true})


-- math $$
-- map("i", "jj", "<ESC>A$$<ESC>F$a",{noremap = true,silent = true})

--flash jump
map("i", "<D-g>", "<CMD>lua require('flash').jump()<CR>")
map("n", "<D-g>", "<CMD>lua require('flash').jump()<CR>")


-- 一些个人设置
map("n", "<leader>set", function ()
  local NvimTreeSize = 25
  vim.cmd("NvimTreeResize " .. NvimTreeSize)
  print("the NvimTree size is " .. NvimTreeSize)
end)

-- cmp 快捷键
map("i", "<D-n>", "<C-n>")

-- Telescope lsp_defination
map("n", "<leader>gd", "<CMD>Telescope lsp_definitions<CR>")
map("n", "<leader>gr", "<CMD>Telescope lsp_references<CR>")
vim.api.nvim_command("command! History :Telescope command_history")
map("n", "?", "<CMD>Noice telescope<CR>")



