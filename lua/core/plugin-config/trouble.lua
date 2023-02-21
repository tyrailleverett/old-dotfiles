require("trouble").setup {
    
}

vim.keymap.set("n", "<leader>xf", "<cmd>TroubleToggle quickfix<cr>",
  {silent = true, noremap = true}
)

vim.keymap.set("n", "<leader>xx", "<cmd>TroubleToggle<cr>",
  {silent = true, noremap = true}
)