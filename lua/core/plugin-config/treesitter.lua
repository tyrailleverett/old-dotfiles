require'nvim-treesitter.configs'.setup {
  ensure_installed = { "python", "lua", "markdown", "dockerfile", "json", "html", "javascript", "typescript", "css", "gitignore", "tsx", "prisma" },

  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true,
  },
  autopairs = {
    enable = true,
  },
  indent = {
    enable = true,
    disable = { "python" },
  },
  autotag = {
    enable = true,

  }
}