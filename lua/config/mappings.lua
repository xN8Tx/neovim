-- Russian keyboard map
local russianMapings = require("utils.russian-mapings").russian

russianMapings()

-- Mappings
local optsWithDesc = require("utils.opts-description").optsWithDesc

local map = vim.keymap.set

map("i", "<Esc>", "<cmd>stopinsert<CR>")
map("i", "jj", "<Esc>", optsWithDesc "Escape to normal mode")
map("i", "оо", "<Esc>", optsWithDesc "Escape to normal mode")
map({ "i", "n" }, "<C-s>", "<Cmd>w<Cr><Esc>", optsWithDesc "Save file and go to normal mode")

map("n", "<leader>K", "<cmd>lua vim.diagnostic.open_float()<CR>", optsWithDesc "Show float")
