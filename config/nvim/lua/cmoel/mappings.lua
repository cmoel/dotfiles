map = function(mode, lhs, rhs, opts)
  local options = {noremap = true}
  if opts then options = vim.tbl_extend("force", options, opts) end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Quickly edit/reload the init.lua file
map("n", "<leader>ev", ":tabedit ~/.config/nvim/init.lua<CR>")
map("n", "<leader>sv", ":source ~/.config/nvim/init.lua<CR>")
map("n", "<leader>em", ":tabedit ~/.config/nvim/lua/cmoel/mappings.lua<CR>")
map("n", "<leader>ep", ":tabedit ~/.config/nvim/lua/cmoel/plugins.lua<CR>")

-- Quick window switching
map("", "<c-j>", "<c-w>j")
map("", "<c-k>", "<c-w>k")
map("", "<c-l>", "<c-w>l")
map("", "<c-h>", "<c-w>h")

map("n", "<leader>w", ":w<CR>")
map("n", "Q", ":<C-U>qall<CR>")
map("n", "-", ":Explore<CR>")

map("n", "0", "^")
map("n", "!", ":!")
map("n", "<leader>r", ":redraw!<CR>")
map("n", "j", "gj")
map("n", "k", "gk")
