local merge = require("utils.merge").merge

local map = vim.keymap.set
local defaultOpts = {
  silent = true,
  noremap = true,
}

map("i", "<Esc>", "<cmd>stopinsert<CR>")
map("i", "jj", "<Esc>", merge(defaultOpts, { desc = "Escape to normal mode" }))
map({ "i", "n" }, "<C-s>", "<Cmd>w<Cr><Esc>", merge(defaultOpts, { desc = "Save file and go to normal mode" }))
