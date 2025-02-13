-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local keymap = vim.keymap

-- 插入模式
keymap.set("i", "jk", "<ESC>")

-- 终端按键修改
keymap.set('t', '<C-t>', '<Cmd>close<CR>')
keymap.set("n", "<c-t>", function() Snacks.terminal(nil, { cwd = LazyVim.root() }) end,
  { desc = "Terminal (Root Dir)" })
