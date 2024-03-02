
vim.g.mapleader = " "

vim.api.nvim_set_keymap("n", "<leader>pv", ":Ex<CR>", { noremap = true, silent = true }) -- List directory
vim.api.nvim_set_keymap("n", "<leader>nt", ":tabnew<CR>", { noremap = true, silent = true }) -- create a new tab
vim.api.nvim_set_keymap("n", "<leader>ct", ":tabclose<CR>", { noremap = true, silent = true }) -- close current tab
vim.api.nvim_set_keymap("n", "<Tab>", ":tabnext<CR>", { noremap = true, silent = true }) -- go to the next tab
vim.api.nvim_set_keymap("n", "<S-Tab>", ":tabprevious<CR>", { noremap = true, silent = true }) -- go the the previous tab
vim.api.nvim_set_keymap("n", "<leader>pf", ":e#<CR>", { noremap = true, silent = true }) -- go back to the previous file
vim.api.nvim_set_keymap("n", "<leader>vs", ":vsp<CR>", { noremap = true, silent = true }) -- vertical split
vim.api.nvim_set_keymap("n", "<leader>hs", ":sp<CR>", { noremap = true, silent = true }) -- horizontal split
vim.api.nvim_set_keymap("v", "J", ":m '>+1<CR>gv=gv", { noremap = true, silent = true }) -- move highlight lines up
vim.api.nvim_set_keymap("v", "K", ":m '<-2<CR>gv=gv", { noremap = true, silent = true }) -- move highlight lines down
vim.api.nvim_set_keymap("x", "<leader>p", "\"_dP", { noremap = true, silent = true }) -- paste without lose paste buffer
vim.api.nvim_set_keymap("n", "<leader>y", "\"+y", { noremap = true, silent = true }) -- yank
vim.api.nvim_set_keymap("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { noremap = true, silent = true }) -- replace what is under the cursor
vim.api.nvim_set_keymap("n", "<leader>x", ":!chmod +x %<CR>", { noremap = true, silent = true }) -- make the file executable
vim.api.nvim_set_keymap("v", "<", "<gv", { noremap = true, silent = true }) -- Stay in indent mode
vim.api.nvim_set_keymap("v", ">", ">gv", { noremap = true, silent = true }) -- Stay in indent mode
vim.api.nvim_set_keymap("n", "<C-Up>", ":resize +2<CR>", { noremap = true, silent = true }) -- Resize with arrows
vim.api.nvim_set_keymap("n", "<C-Down>", ":resize -2<CR>", { noremap = true, silent = true }) -- Resize with arrows
vim.api.nvim_set_keymap("n", "<C-Left>", ":vertical resize -2<CR>", { noremap = true, silent = true }) -- Resize with arrows
vim.api.nvim_set_keymap("n", "<C-Right>", ":vertical resize +2<CR>", { noremap = true, silent = true }) -- Resize with arrows
vim.api.nvim_set_keymap("n", "<leader>t", "<cmd>tabnew <C-R>=expand('%:p')<CR><CR>", { noremap = true, silent = true }) -- Create a new tab with the current file path

