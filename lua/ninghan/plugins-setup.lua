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

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
  augroup end
]])

local status, packer = pcall(require, "packer")
if not status then
  return
end

return packer.startup(function(use)
  -- plugins packer
  use 'wbthomason/packer.nvim'
  use 'nvim-lua/plenary.nvim'
  -- color scheme
  use 'navarasu/onedark.nvim'
  -- nvim coc
  use { 'neoclide/coc.nvim', branch = 'release' }
  -- file exploer
  use 'nvim-tree/nvim-tree.lua'
  use 'nvim-tree/nvim-web-devicons'
  -- status line
  use 'nvim-lualine/lualine.nvim'
  -- fuzzy finding
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
  use { 'nvim-telescope/telescope.nvim', branch = '0.1.x' }
  -- surroundings
  use 'tpope/vim-surround'
  -- autopairs
  use 'windwp/nvim-autopairs'

  if packer_bootstrap then
    require("packer").sync()
  end
end)
