require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })

local function maps(mode, key_table, rhs, opts)
  for _, lhs in ipairs(key_table) do
    map(mode, lhs, rhs, opts)
  end
end

------------------move------------------
map({ "n", "v" }, ";", ":", { desc = "CMD enter command mode" })
map({ "i", "n", "v", "t" }, "<D-x>", "<ESC><ESC>:")
map({ "i", "n", "v", "t" }, "<F1>", "<esc>")
map({ "i", "s" }, "jk", "<ESC>zz")
map({ "n", "v" }, "<D-P>", ":", { desc = "CMD enter command mode" })
map("n", ";", ":", { desc = "CMD enter command mode" })
map({ "i", "n" }, "<D-s>", "<Esc>:w<CR>")
map("n", "Q", "<CMD>q<CR>", { desc = "Quit" })
map({ "i", "c" }, "<D-h>", "<left>", { desc = "Move left" })
map({ "i", "c" }, "<D-l>", "<right>", { desc = "Move right" })
map({ "i", "c" }, "<D-j>", "<down>", { desc = "Move down" })
map({ "i", "c" }, "<D-k>", "<up>", { desc = "Move up" })
map({ "n", "v" }, "J", "5j", { desc = "Scroll down", noremap = true, silent = true })
map({ "n", "v" }, "K", "5k", { desc = "Scroll up", noremap = true, silent = true })
map({ "n", "v", "s" }, "L", "$", { desc = "Move to end of line", noremap = true, silent = true })
map({ "n", "v", "s" }, "H", "^", { desc = "Move to start of line", noremap = true, silent = true })
map("n", "Y", "Vy", { desc = "Yank line" })
map("n", "X", "dd", { desc = "Delete line" })
map("i", "<D-n>", "<C-n>", { desc = "Autocomplete previous" })
map("i", "<D-p>", "<C-p>", { desc = "Autocomplete before" })
map({ "i", "c" }, "<D-backspace>", "<delete>", { desc = "Delete character after cursor" })
map("i", "<D-enter>", "<ESC>o", { desc = "Insert new line" })
map("n", "U", "<C-r>", { desc = "Redo" })
map("n", "<D-z>", "u", { desc = "Undo" })
map("n", "<D-Z>", "<C-r>", { desc = "Redo" })
map({ "n", "v" }, "<D-c>", '"+y', { desc = "Copy to system clipboard" })
map({ "c", "i" }, "<D-v>", "<C-r>+", { desc = "Paste from system clipboard" })
map("t", "<D-v>", "<C-\\><C-N>pi", { desc = "Paste from system clipboard" })
map("i", "<D-u>", "<esc><C-u>a")
map("i", "<D-d>", "<esc><C-d>a")
map({ "n", "v" }, "<Tab>", "%", { desc = "跳转到匹配符号", noremap = true })
map("n", "<C-i>", "<C-i>", { desc = "恢复跳转列表前进", noremap = true })
map("n", "ycc", function()
  return "yy" .. vim.v.count1 .. "gcc']p"
end, { desc = "[y]ank & comment", remap = true, expr = true })

-- Automatically add semicolon or comma at the end of the line in INSERT and NORMAL modes
map("i", ";;", "<ESC>A;")
map("i", ",,", "<ESC>A,")
map("n", ";;", "A;<ESC>")
map("n", ",,", "A,<ESC>")

-- Move lines of text up and down
-- Normal Mode
map("n", "<D-Down>", ":m .+1<CR>==", { silent = true })
map("n", "<D-Up>", ":m .-2<CR>==", { silent = true })
-- Insert Mode
map("i", "<D-Down>", "<esc>:m .+1<CR>==gi", { silent = true })
map("i", "<D-Up>", "<esc>:m .-2<CR>==gi", { silent = true })
-- Visual Mode
map("v", "<D-Down>", ":m '>+1<CR>gv=gv", { silent = true })
map("v", "<D-Up>", ":m '<-2<CR>gv=gv", { silent = true })
------------------buffer------------------
map("n", "<D-E>", "<CMD>Neotree toggle<CR>")
map("n", "<leader>ee", "<CMD>Neotree toggle<CR>")
map("n", "<leader>ef", "<CMD>Neotree reveal_file=%<CR>")
map("n", "<leader>ec", "<CMD>Neotree current %:p:h:h %:p<CR>")
map("n", "<leader>ed", "<CMD>Neotree reveal_file=<cfile><CR>")
-- map("n", "<D-E>", ":Neotree toggle<CR>")
maps("n", { "<leader>bd", "<D-w>" }, function()
  Snacks.bufdelete()
end, { desc = "Delete Buffer" })
map("n", "<leader>bb", "<CMD>e #<CR>", { desc = "Previous buffer" })
maps("n", { "<leader>bs", "<D-s>" }, "<CMD>w<CR>", { desc = "Save buffer" })
maps("n", { "<leader>bp", "<D-]>", "<D-k>" }, "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
maps("n", { "<leader>bn", "<D-]>", "<D-j>" }, "<cmd>bnext<cr>", { desc = "Next Buffer" })
maps("n", { "<D-e>", "<leader>be" }, "<CMD> lua Snacks.picker.buffers()<CR>", { desc = "List buffers" })
map("n", "<D-t>", "<CMD>lua Snacks.scratch()<CR>", { desc = "open scratch" })
map("n", "<D-T>", "<CMD>lua Snacks.scratch.select()<CR>", { desc = "open scratch" })

------------------window------------------
maps("n", { "<leader>wh", "<D-H>" }, "<C-w>h", { desc = "Focus left window" })
maps("n", { "<leader>wj", "<D-J>" }, "<C-w>j", { desc = "Focus lower window" })
maps("n", { "<leader>wk", "<D-K>" }, "<C-w>k", { desc = "Focus upper window" })
maps("n", { "<leader>wl", "<D-L>" }, "<C-w>l", { desc = "Focus right window" })

local function move_other_win(direction)
  local current_win = vim.api.nvim_get_current_win()
  local cur_pos = vim.api.nvim_win_get_cursor(current_win)

  vim.cmd("wincmd w")
  if direction == "j" then
    vim.cmd([[execute "normal! jzz"]])
  elseif direction == "k" then
    vim.cmd([[execute "normal! kzz"]])
  elseif direction == "d" then
    vim.cmd([[execute "normal! \<C-d>zz"]])
  elseif direction == "u" then
    vim.cmd([[execute "normal! \<C-u>zz"]])
  end
  vim.cmd("wincmd p")

  -- 保持插入模式的光标位置
  vim.api.nvim_win_set_cursor(current_win, cur_pos)
end

-- 插入模式映射
vim.keymap.set("i", "<C-d>", function()
  move_other_win("d")
end, { noremap = true })
vim.keymap.set("i", "<C-u>", function()
  move_other_win("u")
end, { noremap = true })
vim.keymap.set("i", "<C-j>", function()
  move_other_win("j")
end, { noremap = true })
vim.keymap.set("i", "<C-k>", function()
  move_other_win("k")
end, { noremap = true })
------------------lsp------------------
map("i", "<c-s>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", { desc = "Signature help" })
map("n", "gh", function()
  return vim.lsp.buf.hover()
end, { desc = "hover" })
map("n", "gd", function()
  return vim.lsp.buf.definition()
end)
map("n", "<f12>", function()
  return vim.lsp.buf.definition()
end)
map("n", "]s", "<CMD>lua Snacks.words.jump(1)<CR>", { desc = "Next l[s]p words" })
map("n", "[s", "<CMD>lua Snacks.words.jump(-1)<CR>", { desc = "Prev l[s]p words" })

------------------file------------------
map("n", "<D-T>", ":e#<cr>", { desc = "Toggle between two files" })
map("n", "<D-o>", function()
  Snacks.picker.files({ cwd = vim.fn.expand("%:p:h") })
end, { desc = "Find Files in current wd" })
map("n", "<D-S-o>", function()
  Snacks.picker.files()
end, { desc = "Find Files" })
map(
  "n",
  "<leader>fC",
  "<CMD>lua Snacks.picker.grep({cwd = vim.fn.expand('~/.config/nvim')})<CR>",
  { desc = "[f]ind [C]onfig" }
)

------------------cursor------------------
map("n", "<D-a>", "ggVG", { desc = "Select all" })
map("n", "<D-c>", '"+y', { desc = "Copy to system clipboard" })
map("v", "<D-v>", '"+p', { desc = "Paste from system clipboard" })
map("n", "yc", "yy<cmd>normal gcc<CR>p")
map("n", "<CR>", "ciw")

------------------terminal------------------
local TERM_OPT = {
  main = {
    cmd = nil,
    opts = {
      win = { position = "float" },
      env = { TERM_TYPE = "main" },
    },
  },
  test = {
    cmd = nil,
    opts = {
      win = { position = "float" },
      env = { TERM_TYPE = "test" },
    },
  },
  other = {
    cmd = nil,
    opts = {
      win = { position = "float" },
      env = { TERM_TYPE = "other" },
    },
  },
}
local check_term_closed = function(term_opt)
  local term = Snacks.terminal.get(term_opt.cmd, term_opt.opts)
  if term == nil then
    error("term is nil")
  end
  if term.closed then
    return true
  end
  return false
end

local close_all_terminal = function()
  for _, term_opt in pairs(TERM_OPT) do
    local closed = check_term_closed(term_opt)
    if not closed then
      Snacks.terminal.toggle(term_opt.cmd, term_opt.opts)
    end
  end
end

maps({ "n", "t", "i" }, { "<C-1>", "<D-1>" }, function()
  local term_opt = TERM_OPT.main
  -- 检查当前 term 有没有打开
  local closed = check_term_closed(term_opt)
  close_all_terminal()
  if not closed then
    return
  else
    Snacks.terminal.toggle(term_opt.cmd, term_opt.opts)
  end
end)
maps({ "n", "t", "i" }, { "<C-2>", "<D-2>" }, function()
  local term_opt = TERM_OPT.test
  -- 检查当前 term 有没有打开
  local closed = check_term_closed(term_opt)
  close_all_terminal()
  if not closed then
    return
  else
    Snacks.terminal.toggle(term_opt.cmd, term_opt.opts)
  end
end)
maps({ "n", "t", "i" }, { "<C-3>", "<D-3>" }, function()
  local term_opt = TERM_OPT.other
  -- 检查当前 term 有没有打开
  local closed = check_term_closed(term_opt)
  close_all_terminal()
  if not closed then
    return
  else
    Snacks.terminal.toggle(term_opt.cmd, term_opt.opts)
  end
end)

map({ "n", "t", "i" }, "<C-`>", function()
  Snacks.terminal.toggle(nil, { win = { position = "bottom" }, env = { TERM_TYPE = "bottom" } })
end)

map({ "n", "t", "i" }, "<f9>", function()
  close_all_terminal()
end, { desc = "Close all terminals" })

map("n", "<C-_>", function()
  Snacks.terminal(nil, { cwd = LazyVim.root() })
end, { desc = "which_key_ignore" })
map("t", "jk", "<C-\\><C-n>")
map("n", "+", function()
  require("dial.map").manipulate("increment", "normal")
end)
map("n", "-", function()
  require("dial.map").manipulate("decrement", "normal")
end)

------------------editor------------------
map("n", "gcf", "<CMD>:lua require('neogen').generate()<CR>", { desc = "generate comment" })

------------------ui------------------
map("n", "<leader>n", "") -- 覆盖lazyvim默认映射
maps("n", { "<leader>nh", "<leader>nn" }, function()
  Snacks.notifier.show_history()
end, { desc = "show [N]otification [h]istory" })
map("n", "<leader>nm", "<CMD>messages<CR>", { desc = "show [N]otification [m]essages" })

------------------ai------------------
map("n", "<leader>as", function()
  vim.cmd("Copilot suggestion")
  vim.api.nvim_feedkeys("a", "n")
end, { desc = "toggle copilot suggestion" })
map("n", "<leader>ap", "<CMD>Copilot panel<CR>", { desc = "toggle copilot panel" })

------------------escape------------------
map({ "i", "n", "t" }, "<esc>", function()
  close_all_terminal()
    vim.cmd("noh")
    vim.cmd("stopinsert")
end, { desc = "Escape and Clear hlsearch" })

------------------latex------------------
-- Keybindings (optional)
map("n", "<leader>lc", ":VimtexCompile<CR>", { desc = "Compile LaTeX" })
map("n", "<leader>le", ":VimtexCompile<CR>", { desc = "Show vimtex errors" })
map("n", "<leader>lv", ":VimtexView<CR>", { desc = "View PDF" })
map("n", "<leader>lx", ":VimtexStop<CR>", { desc = "Stop Compilation" })
