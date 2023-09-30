vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex) -- List directory 


vim.keymap.set("n", "<leader>nt", ":exec 'tabnew'<CR>") -- create a new tab
vim.keymap.set("n", "<leader>ct", ":exec 'tabclose'<CR>") -- close current tab
vim.keymap.set("n", "<Tab>", ":tabnext<CR>", { noremap = true, silent = true }) -- go to the next tab
vim.keymap.set("n", "<S-Tab>", ":tabprevious<CR>", { noremap = true, silent = true }) -- go the the previous tab

vim.keymap.set("n", "<leader>pf", ":exec 'e#'<CR>") -- go back to the previous file

vim.keymap.set("n", "<leader>vs", ":exec ':vsp'<CR>") -- vertical split
vim.keymap.set("n", "<leader>hs", ":exec ':sp'<CR>") -- horizontal split
