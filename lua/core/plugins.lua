local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use 'ellisonleao/gruvbox.nvim'
  use 'nvim-tree/nvim-tree.lua'
  use 'windwp/nvim-ts-autotag'
  use 'nvim-tree/nvim-web-devicons'
  use 'nvim-treesitter/nvim-treesitter'
  
  use 'nvim-lualine/lualine.nvim'
  use {
	"windwp/nvim-autopairs",
    config = function() require("nvim-autopairs").setup {} end
    }
  use {
	  'nvim-telescope/telescope.nvim',
	  tag = '0.1.0',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }
  use {'akinsho/bufferline.nvim', tag = "v3.*", 
    requires = 'nvim-tree/nvim-web-devicons'}

use {
  'VonHeikemen/lsp-zero.nvim',
  branch = 'v1.x',
  requires = {
    -- LSP Support
    {'neovim/nvim-lspconfig'},             
    {'williamboman/mason.nvim'},           
    {'williamboman/mason-lspconfig.nvim'}, 

    -- Autocompletion
    {'hrsh7th/nvim-cmp'},         
    {'hrsh7th/cmp-nvim-lsp'},     
    {'hrsh7th/cmp-buffer'},       
    {'hrsh7th/cmp-path'},         
    {'saadparwaiz1/cmp_luasnip'}, 
    {'hrsh7th/cmp-nvim-lua'},     

    -- Snippets
    {'L3MON4D3/LuaSnip'},             
    {'rafamadriz/friendly-snippets'}, 
  }
}
  use({
      "glepnir/lspsaga.nvim",
      branch = "main",
      config = function()
          require("lspsaga").setup({})
      end,
      requires = {
          {"nvim-tree/nvim-web-devicons"},
          {"nvim-treesitter/nvim-treesitter"}
      }
  })
  use 'lewis6991/gitsigns.nvim'
  use "akinsho/toggleterm.nvim"
  use "folke/trouble.nvim"
  use "jose-elias-alvarez/null-ls.nvim"
  use 'folke/lsp-colors.nvim'
  use 'Vimjas/vim-python-pep8-indent'
  use "mbbill/undotree"
  use {
  "startup-nvim/startup.nvim",
  requires = {"nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim"}
}


  if packer_bootstrap then
    require('packer').sync()
  end
end)