local lsp = require('lsp-zero').preset({
  name = 'minimal',
  set_lsp_keymaps = true,
  manage_nvim_cmp = true,
  suggest_lsp_servers = false
})

lsp.nvim_workspace()

lsp.configure('pylsp', {
  settings = {
    pylsp = {
      plugins = {
        pyflakes = {enabled = false},
        pycodestyle = {enabled = false}
      }
    }
  }
})

lsp.setup()

