local status_ok, toggleterm = pcall(require, "toggleterm")
if not status_ok then
  return
end

toggleterm.setup {
  size = 10,
  open_mapping = [[<c-\>]],
  hide_numbers = true,
  shade_filetypes = {},
  shade_terminals = true,
  shading_factor = 2,
  start_in_insert = true,
  insert_mappings = true,
  persist_size = true,
  winbar = {
    enabled = false,
    name_formatter = function(term)
      return term.name
    end
  },
}

function _G.set_terminal_keymaps()
  local opts = {buffer = 0}
  vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
end

-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')


local Terminal = require("toggleterm.terminal").Terminal
local lazygit = Terminal:new {
  cmd = "lazygit",
  hidden = true,
  direction = "float",
  --float_opts = {
  --  border = "none",
  --  width = 100000,
  --  height = 100000,
  --},
  on_open = function(_)
    vim.cmd "startinsert!"
  end,
}

function _LAZYGIT_TOGGLE()
  lazygit:toggle()
end


vim.keymap.set("n", "tl", "<cmd>lua _LAZYGIT_TOGGLE()<CR>", { noremap = true, silent = true })

vim.keymap.set("n", "tt", "<cmd>:ToggleTermToggleAll<CR>", { noremap = true, silent = true })
vim.keymap.set("t", "tt", "<cmd>:ToggleTermToggleAll<CR>", { noremap = true, silent = true })


vim.keymap.set("n", "th", function() 
     return "<cmd> " .. vim.v.count1 .. ":ToggleTerm size=10 direction=horizontal<CR>" end, {expr = true})
