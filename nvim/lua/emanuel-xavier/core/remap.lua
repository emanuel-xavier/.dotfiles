vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex) -- List directory 


vim.keymap.set("n", "<leader>nt", ":exec 'tabnew'<CR>") -- create a new tab
vim.keymap.set("n", "<leader>ct", ":exec 'tabclose'<CR>") -- close current tab
vim.keymap.set("n", "<Tab>", ":tabnext<CR>", { noremap = true, silent = true }) -- go to the next tab
vim.keymap.set("n", "<S-Tab>", ":tabprevious<CR>", { noremap = true, silent = true }) -- go the the previous tab

vim.keymap.set("n", "<leader>pf", ":exec 'e#'<CR>") -- go back to the previous file

vim.keymap.set("n", "<leader>vs", ":exec ':vsp'<CR>") -- vertical split
vim.keymap.set("n", "<leader>hs", ":exec ':sp'<CR>") -- horizontal split

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv") -- move highlight lines up
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv") -- move highlight lines down

vim.keymap.set("x", "<leader>p", "\"_dP") -- paste without lose paste buffer
vim.keymap.set("n", "<leader>y", "\"+y") -- yank

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]]) -- replace what is under the cursor
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true }) -- make the file executable
