require('telescope').setup{
    defaults = {
        file_ignore_patterns = {
            "node_modules/*",
            "venv/*",
            "__pycache__/*",
        }
    }
}
local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fw', builtin.live_grep, {})
