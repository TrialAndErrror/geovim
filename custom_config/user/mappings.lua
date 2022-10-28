local map = vim.keymap.set
local unmap = vim.keymap.del
local is_available = astronvim.is_available

-- remove default bindings
unmap("n", "<C-Down>")
unmap("n", "<C-Left>")
unmap("n", "<C-Right>")
unmap("n", "<C-Up>")
unmap("n", "<C-q>")
unmap("n", "<C-s>")
unmap("v", "<")
unmap("v", ">")
unmap("t", "<esc>")
unmap("t", "jk")
unmap("n", "<leader>h")
if is_available "telescope.nvim" then
  unmap("n", "<leader>fh")
  unmap("n", "<leader>sb")
  unmap("n", "<leader>sc")
  unmap("n", "<leader>sh")
  unmap("n", "<leader>sk")
  unmap("n", "<leader>sm")
  unmap("n", "<leader>sn")
  unmap("n", "<leader>sr")
end

-- resize with arrows
map("n", "<Up>", function()
  require("smart-splits").resize_up(2)
end, { desc = "Resize split up" })
map("n", "<Down>", function()
  require("smart-splits").resize_down(2)
end, { desc = "Resize split down" })
map("n", "<Left>", function()
  require("smart-splits").resize_left(2)
end, { desc = "Resize split left" })
map("n", "<Right>", function()
  require("smart-splits").resize_right(2)
end, { desc = "Resize split right" })

-- navigating wrapped lines
map({ "n", "v" }, "j", "gj", { desc = "Nagivate down" })
map({ "n", "v" }, "k", "gk", { desc = "Navigate up" })

-- easy splits
map("n", "\\", "<cmd>split<cr>", { desc = "Horizontal split" })
map("n", "|", "<cmd>vsplit<cr>", { desc = "Vertical split" })

-- line text-objects
map("x", "il", "g_o^", { desc = "Inside line text object" })
map("o", "il", ":normal vil<cr>", { desc = "Inside line text object" })
map("x", "al", "$o^", { desc = "Around line text object" })
map("o", "al", ":normal val<cr>", { desc = "Around line text object" })

-- more in/all objects between 2 characters
for _, char in ipairs { "_", ".", ":", ",", ";", "|", "/", "\\", "*", "+", "%", "`", "?" } do
  for _, mode in ipairs { "x", "o" } do
    map(mode, "i" .. char, (":<C-u>silent! normal! f%sF%slvt%s<CR>"):format(char, char, char))
    map(mode, "a" .. char, (":<C-u>silent! normal! f%sF%svf%s<CR>"):format(char, char, char))
  end
end

-- terminal mappings
map("t", "<leader><esc>", "<c-\\><c-n>", { desc = "Terminal normal mode" })
map("t", "<esc><esc>", "<c-\\><c-n>:q<cr>", { desc = "Terminal quit" })

-- treesitter surfer
map("x", "J", function()
  require("syntax-tree-surfer").surf("next", "visual")
end, { desc = "Surf next tree-sitter object" })
map("x", "K", function()
  require("syntax-tree-surfer").surf("prev", "visual")
end, { desc = "Surf previous tree-sitter object" })
map("x", "H", function()
  require("syntax-tree-surfer").surf("parent", "visual")
end, { desc = "Surf parent tree-sitter object" })
map("x", "L", function()
  require("syntax-tree-surfer").surf("child", "visual")
end, { desc = "Surf child tree-sitter object" })
map("x", "<c-j>", function()
  require("syntax-tree-surfer").surf("next", "visual", true)
end, { desc = "Surf next tree-sitter object" })
map("x", "<c-l>", function()
  require("syntax-tree-surfer").surf("next", "visual", true)
end, { desc = "Surf next tree-sitter object" })
map("x", "<c-k>", function()
  require("syntax-tree-surfer").surf("prev", "visual", true)
end, { desc = "Surf previous tree-sitter object" })
map("x", "<c-h>", function()
  require("syntax-tree-surfer").surf("prev", "visual", true)
end, { desc = "Surf previous tree-sitter object" })
map("n", "<c-down>", function()
  require("syntax-tree-surfer").move("n", false)
end, { desc = "Swap next tree-sitter object" })
map("n", "<c-right>", function()
  require("syntax-tree-surfer").move("n", false)
end, { desc = "Swap next tree-sitter object" })
map("n", "<c-up>", function()
  require("syntax-tree-surfer").move("n", true)
end, { desc = "Swap previous tree-sitter object" })
map("n", "<c-left>", function()
  require("syntax-tree-surfer").move("n", true)
end, { desc = "Swap previous tree-sitter object" })

-- dapui
map("n", "duc", function()
  require("dapui").close()
end, { desc = "Dap UI: Close" })
map("n", "dut", function()
  require("dapui").toggle()
end, { desc = "Dap UI: Toggle" })

-- telescope-projects
map("n", "<c-p>", function()
  require("telescope").extensions.project.project {}
end)
