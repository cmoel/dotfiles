vim.g["test#strategy"] = "vtr"

map("n", "<leader>T", ":TestFile<CR>")
map("n", "<leader>t", ":TestNearest<CR>")
map("n", "<leader>l", ":TestLast<CR>")
map("n", "<leader>a", ":TestSuite<CR>")
