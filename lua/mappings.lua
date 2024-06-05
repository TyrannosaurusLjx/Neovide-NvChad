require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>:!/opt/homebrew/bin/im-select com.apple.keylayout.ABC<CR>",{noremap = true,silent = true})

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")


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

-- map("v", "<D-j>", "<Down>")
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
map("n", "<D-q>", "<ESC>:wq!")

-- clear search
map("n", "//", "<ESC>:noh<CR>")


-- New file
map("n", "<leader>n", ":n ")

-- buffer close
-- map("i", "<D-w>", "<ESC>:bd<CR>")
-- map("n", "<D-w>", "<ESC>:bd<CR>")
map("i", "<D-w>", "<ESC>w<CR><CMD>lua require('bufdelete').bufdelete(0, true)<CR>",{noremap = true,silent = true})
map("n", "<D-w>", "<ESC>w<CMD>lua require('bufdelete').bufdelete(0, true)<CR>",{noremap = true,silent = true})


-- new window(tab)
map("i", "<D-n>", "<ESC>:tabnew<CR>")
map("n", "<D-n>", "<ESC>:tabnew<CR>")

-- new buffer
map("i", "<D-t>", "<ESC>:enew<CR>")
map("n", "<D-t>", "<ESC>:enew<CR>")

-- nav buffer
-- map("i", "<D-]>", "<ESC>:bnext<CR>",  { noremap = true, silent = true })
-- map("i", "<D-[>", "<ESC>:bprevious<CR>")
map("n", "<D-]>", "<ESC>:bnext<CR>")
map("n", "<D-[>", "<ESC>:bprevious<CR>")

-- nav split
-- map("i", "<D-}>", "<ESC><C-w><C-w>")
-- map("i", "<D-{>", "<ESC><C-w>p")
map("n", "<D-}>", "<ESC><C-w><C-w>")
map("n", "<D-{>", "<ESC><C-w>p")

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

-- terminal
map("n", "<C-`>", function()
  require("nvchad.term").new { pos = "sp", size = 0.3 }
end, { desc = "Terminal New horizontal term" })

-- search
map("i", "<D-f>", "<ESC>/")
map("n", "<D-f>", "<ESC>/")

-- undo
map("i", "<D-z>", "<CMD>:undo<CR>")
map("i", "<D-Z>", "<CMD>:redo<CR>")
map("n", "<D-z>", "<CMD>:undo<CR>")
map("n", "<D-Z>", "<CMD>:redo<CR>")

-- copy and paste
map("i", "<D-v>", "<ESC>pi")
map("n", "<D-v>", "<ESC>p")
map("v", "<D-c>", "y")

-- select all
map("i", "<D-a>", "<ESC>ggVG")
map("n", "<D-a>", "<ESC>ggVG")

-- bookmark
map("n", "<D-m>", "<CMD>lua require'bookmarks'.add_bookmarks(true)<CR>")
-- Telescope
map("n", "<D-r>", "<cmd>Telescope oldfiles<CR>", { desc = "Telescope Find oldfiles" })

-- Session
map('n', '<D-R>', '<cmd>lua require("auto-session.session-lens").search_session()<CR>', { noremap = true, silent = true })

-- MarkdownPreview
-- map('n', "<F8>", "<ESC>:MarkdownPreview<CR>")
map("v", "<D-b>", "s****<ESC>hP",{noremap = true,silent = true})
-- map('n', '<F8>', '<cmd>lua if vim.bo.filetype == "markdown" then vim.cmd(":MarkdownPreview") end<CR>', { noremap = true, silent = true })

-- latex编译
-- vim.fn.expand('%:p:r') .. ".pdf"
map('n', '<F8>',function()
  -- 绝对名
  -- 父目录
  local fileDirectory = vim.fn.expand('%:p:h')
  -- 文件名
  local filename = vim.fn.fnamemodify(vim.fn.expand('%:p'), ":t:r")
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
map("n", "<c-p>","<ESC>:call mdip#MarkdownClipboardImage()<CR><ESC>",{noremap = true,silent = true})
map("i", "<c-p>","<ESC>:call mdip#MarkdownClipboardImage()<CR><ESC>",{noremap = true,silent = true})

-- copilot.lua accept
map("i", "<F12>", '<cmd>lua require("copilot.suggestion").accept()<CR>',{noremap = true,silent = true})
map("i", "<D-F12>", '<cmd>lua require("copilot.suggestion").accept_word()<CR>',{noremap = true,silent = true})


-- math $$
-- map("i", "jj", "<ESC>A$$<ESC>F$a",{noremap = true,silent = true})

--flash jump
map("i", "<D-g>", "<CMD>lua require('flash').jump()<CR>")
map("n", "<D-g>", "<CMD>lua require('flash').jump()<CR>")





















