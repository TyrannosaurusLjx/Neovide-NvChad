require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map({"n", "v"}, ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

-- buffer 管理y
map("n", "<D-w>", "<CMD>lua require('bufdelete').bufdelete(0, true)<CR>")

for i = 1, 9, 1 do
  map("n", string.format("<D-%s>", i), function()
    vim.api.nvim_set_current_buf(vim.t.bufs[i])
  end)
end

map("n", "<D-]>", "<CMD>bnext<CR>")
map("n", "<D-[>", "<CMD>bprevious<CR>")
map("n", "<D-}>", "<CMD>tabNext<CR>")
map("n", "<D-{>", "<CMD>tabprevious<CR>")
-- map("n", "<D-{>", "<CMD>lua require('nvchad.tabufline').move_buf(-1)<CR>")
-- map("n", "<D-}>", "<CMD>lua require('nvchad.tabufline').move_buf(1)<CR>")
map("n", "<tab>", "jzz")

--markdown 
map("n", "<leader>mp", "<CMD>call mdip#MarkdownClipboardImage()<CR>")

map("n", "<D-a>", "<CMD>AerialToggle<CR>")

-- 文件搜索等
map("n", "<D-F>", "<CMD>Telescope live_grep<CR>",{noremap = true,silent = true})
map("n", "<D-E>", "<CMD>Telescope find_files<CR>")
map("n", "<D-f>", "<CMD>Telescope current_buffer_fuzzy_find<CR>")

-- 取消搜索高亮
map("n", "//", "<CMD>nohl<CR>")

-- 匹配
map("i", "<D-n>", "<C-p>")

--向后删除
map({"i", "c"}, "<D-backspace>", "<Right><backspace>" )

--下一行
map("i", "<D-enter>", "<ESC>o")

--撤销撤销
map("n", "U", "<C-r>")
map("n", "<D-z>", "u")
map("n", "<D-Z>", "<C-r>")

-- comment 注释
map("n", "<leadr-/>", function()
    require("Comment.api").toggle.linewise.current()
  end, { desc = "Comment Toggle" })

map("v", "<leader-/>", "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
    { desc = "Comment Toggle" }
)

-- flash
map({ "n", "x", "o" }, "s", "<CMD>lua require('flash').jump() <CR>", {desc = "Flash" })

map({ "n", "x", "o" }, "S" ,"<CMD>lua require('flash').treesitter() <CR>" , {desc = "Flash Treesitter"} )

--窗口管理
map("n", "<leader>h", "<C-w>h")
map("n", "<leader>j", "<C-w>j")
map("n", "<leader>k", "<C-w>k")
map("n", "<leader>l", "<C-w>l")
map("n", "<D-h>", "<C-w>h")
map("n", "<D-j>", "<C-w>j")
map("n", "<D-k>", "<C-w>k")
map("n", "<D-l>", "<C-w>l")
map("n", "<D-L>","<CMD>:vsplit<CR><CMD>Telescope buffers<CR>")
map("n", "<D-H>","<CMD>:vsplit<CR><C-w>h<CMD>Telescope buffers<CR>")
map("n", "<D-J>","<CMD>:split<CR><CMD>Telescope buffers<CR>")
map("n", "<D-K>","<CMD>:split<CR><C-w>k<CMD>Telescope buffers<CR>")

-- 终端
-- map("n", {"<C-`>", "<D-t>"}, "<CMD>")

-- 部分移动按键
map({"i", "c"}, "<D-j>", "<Down>")
map({"i", "c"}, "<D-k>", "<Up>")
map({"i", "c"}, "<D-h>", "<Left>")
map({"i", "c"}, "<D-l>", "<Right>")

map({"n", "v"}, "J" , "<C-d>" )
map({"n", "v"}, "K" , "<C-u>" )

map({"n"}, "L", "$")
map({"n"}, "H", "^")


-- 类vscode 按键
map({"i", "n"}, "<D-s>", function ()
  if vim.bo.filetype == "tex" then
    vim.cmd("w")
    vim.cmd("silent !xelatex %")
  else
    vim.cmd("w")
  end
  
  vim.api.nvim_input('<ESC>')

end)

-- bookmark
map("n", "<leader>ml", "<CMD>lua require'bookmarks'.toggle_bookmarks()<CR>" )
map("n", "<leader>mm", "<CMD>lua require'bookmarks'.add_bookmarks(true)<CR>")
-- map("n", "<leader>ml", "<CMD>lua require'bookmarks'.toggle_bookmarks()<CR>")

--文件预览和 trouble
map("n", "<D-e>", "<CMD>NvimTreeToggle<CR>")
map("n", "<D-p>", function ()
  local win_id = vim.api.nvim_get_current_win()
  local buf_id = vim.api.nvim_win_get_buf(win_id)
  local buf_name = vim.api.nvim_buf_get_name(buf_id)

  -- Check if the buffer name contains 'NvimTree'
  if string.match(buf_name, "NvimTree") then
    -- If in NvimTree, execute nvim-tree-preview watch
    vim.cmd('lua require("nvim-tree-preview").watch()')
  else
    -- Otherwise, toggle Trouble diagnostics
    vim.cmd("lua require('goto-preview').goto_preview_definition()")
  end
end) -- preview

map("n", "<leader>tl", function ()
  vim.cmd("NvimTreeFocus")
  vim.cmd("Trouble diagnostics filter.severity=vim.diagnostic.severity.ERROR win.relative=win win.position=bottom")
end)


-- session 最近打开的项目
map("n", "<D-R>", "<CMD>Telescope session-lens<CR>")

-- <F8>
map("n", "<F8>", "", {
  noremap = true,
  silent = true,
  callback = function()
    -- 如果是 markdown 文件
    if vim.bo.filetype == "markdown" then
      vim.cmd("MarkdownPreview")
    elseif vim.bo.filetype == "tex" then
      -- 运行 xelatex
      vim.cmd("silent !xelatex % &")
    else
      print("不支持的文件类型")
    end
  end
})

-- 复制粘贴
map({"n", "v"}, "<D-c>", '"+y')
map({"n", "c", "i"}, "<D-v>", "<C-r>+")


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


map("n", "?", function ()
  -- show help, ~/.config/nvim/Tutor/*.txt
  -- 获取文件内容
  local file = vim.fn.expand("~/.config/nvim/Tutor/surround.txt")
  -- 打印内容
  vim.cmd("edit " .. file)
end)



--rename
map("n", "<leader>rn", function()
  return ":IncRename " .. vim.fn.expand("<cword>")
end, { expr = true })
