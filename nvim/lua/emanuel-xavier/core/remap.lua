
vim.g.mapleader = " "

vim.keymap.set("n", "<leader>pv", ":Ex<CR>", { noremap = true, silent = true, desc = "List directory"}) 
vim.keymap.set("n", "<leader>nt", ":tabnew<CR>", { noremap = true, silent = true, desc = "create a new tab"}) 
vim.keymap.set("n", "<leader>ct", ":tabclose<CR>", { noremap = true, silent = true, desc = "close current tab"}) 
vim.keymap.set("n", "<Tab>", ":tabnext<CR>", { noremap = true, silent = true, desc = "go to the next tab"}) 
vim.keymap.set("n", "<S-Tab>", ":tabprevious<CR>", { noremap = true, silent = true, desc="go the the previous tab" }) 
vim.keymap.set("n", "<leader>pf", ":e#<CR>", { noremap = true, silent = true, desc= "go back to the previous file" }) 
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { noremap = true, silent = true, desc= "move highlight lines up" }) 
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { noremap = true, silent = true, desc= "move highlight lines down" }) 
vim.keymap.set("x", "<leader>p", "\"_dP", { noremap = true, silent = true, desc= "paste without lose paste buffer" }) 
vim.keymap.set("n", "<leader>y", "\"+y", { noremap = true, silent = true, desc= "yank" }) 
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { noremap = true, silent = true, desc= "replace what is under the cursor" }) 
vim.keymap.set("n", "<leader>x", ":!chmod +x %<CR>", { noremap = true, silent = true, desc= "make the file executable" }) 
vim.keymap.set("v", "<", "<gv", { noremap = true, silent = true, desc= "Stay in indent mode" }) 
vim.keymap.set("v", ">", ">gv", { noremap = true, silent = true, desc= "Stay in indent mode" }) 
vim.keymap.set("n", "<C-Up>", ":resize +2<CR>", { noremap = true, silent = true, desc= "Resize with arrows" }) 
vim.keymap.set("n", "<C-Down>", ":resize -2<CR>", { noremap = true, silent = true, desc= "Resize with arrows" }) 
vim.keymap.set("n", "<C-Left>", ":vertical resize -2<CR>", { noremap = true, silent = true, desc= "Resize with arrows" }) 
vim.keymap.set("n", "<C-Right>", ":vertical resize +2<CR>", { noremap = true, silent = true, desc= "Resize with arrows" }) 
vim.keymap.set("n", "<leader>t", "<cmd>tabnew <C-R>=expand('%:p')<CR><CR>", { noremap = true, silent = true, desc= "Create a new tab with the current file path" }) 
vim.keymap.set("n", "<ESC>", "<cmd>nohlsearch<CR>", { noremap = true, silent = tru, desc= "remove highlight search" }) 

