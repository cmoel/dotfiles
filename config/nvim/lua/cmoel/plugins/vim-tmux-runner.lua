vim.g["VtrOrientation"] = "h"
vim.g["VtrPercentage"] = 35

map("n", "<leader>T", ":TestFile<CR>")
map("n", "<leader>t", ":TestNearest<CR>")
map("n", "<leader>l", ":TestLast<CR>")
map("n", "<leader>a", ":TestSuite<CR>")

map("n", "<leader>ra", ":VtrAttachToPane<CR>")
map("n", "<leader>rf", ":VtrFocusRunner<CR>")
map("n", "<leader>rr", ":VtrSendLinesToRunner<CR>")
map("n", "<leader>rd", ":VtrSendCtrlD<CR>")
map("n", "<leader>sf", ":VtrSendFile<CR>")
