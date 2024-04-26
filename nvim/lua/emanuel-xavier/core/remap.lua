vim.g.mapleader = " "

local keymap = vim.keymap

keymap.set("n", "<leader>pv", ":Ex<CR>", { noremap = true, silent = true, desc = "List directory"}) 

keymap.set("n", "<leader>nt", ":tabnew<CR>", { noremap = true, silent = true, desc = "create a new tab"}) 
keymap.set("n", "<leader>ct", ":tabclose<CR>", { noremap = true, silent = true, desc = "close current tab"}) 
keymap.set("n", "<Tab>", ":tabnext<CR>", { noremap = true, silent = true, desc = "go to the next tab"}) 
keymap.set("n", "<S-Tab>", ":tabprevious<CR>", { noremap = true, silent = true, desc="go the the previous tab" }) 
keymap.set("n", "<leader>t", "<cmd>tabnew <C-R>=expand('%:p')<CR><CR>", { noremap = true, silent = true, desc= "Create a new tab with the current file path" }) 

keymap.set("n", "<leader>nb", "<cmd>:bnext<CR>", { noremap = true, silent = true, desc = "go to next buffer"})
keymap.set("n", "<leader>pb", "<cmd>:bprevious<CR>", { noremap = true, silent = true, desc = "go to previous buffer"})

keymap.set("n", "<leader>pf", ":e#<CR>", { noremap = true, silent = true, desc= "go back to the previous file" }) 

keymap.set("v", "J", ":m '>+1<CR>gv=gv", { noremap = true, silent = true, desc= "move highlight lines up" }) 
keymap.set("v", "K", ":m '<-2<CR>gv=gv", { noremap = true, silent = true, desc= "move highlight lines down" }) 

keymap.set("n", "<ESC>", "<cmd>nohlsearch<CR>", { noremap = true, silent = true, desc = "remove highlight search" }) 

keymap.set("x", "<leader>p", "\"_dP", { noremap = true, silent = true, desc= "paste without lose paste buffer" }) 
keymap.set("n", "<leader>y", "\"+y", { noremap = true, silent = true, desc= "yank" }) 
keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { noremap = true, silent = true, desc= "replace what is under the cursor" }) 

keymap.set("v", "<", "<gv", { noremap = true, silent = true, desc= "Stay in indent mode" }) 
keymap.set("v", ">", ">gv", { noremap = true, silent = true, desc= "Stay in indent mode" }) 

keymap.set("n", "<C-Up>", ":resize +2<CR>", { noremap = true, silent = true, desc= "Resize with arrows" }) 
keymap.set("n", "<C-Down>", ":resize -2<CR>", { noremap = true, silent = true, desc= "Resize with arrows" }) 
keymap.set("n", "<C-Left>", ":vertical resize -2<CR>", { noremap = true, silent = true, desc= "Resize with arrows" }) 
keymap.set("n", "<C-Right>", ":vertical resize +2<CR>", { noremap = true, silent = true, desc= "Resize with arrows" }) 
