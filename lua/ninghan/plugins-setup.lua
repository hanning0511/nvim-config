local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
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
	use("wbthomason/packer.nvim")
	use("nvim-lua/plenary.nvim")
	-- color scheme
	use("sainnhe/everforest")
	use("olimorris/onedarkpro.nvim")
	use("folke/tokyonight.nvim")
	use({ "catppuccin/nvim", as = "catppuccin" })
	use("ellisonleao/gruvbox.nvim")
	use("rebelot/kanagawa.nvim")

	-- file exploer
	use("nvim-tree/nvim-tree.lua")
	use("nvim-tree/nvim-web-devicons")
	-- status line
	use("nvim-lualine/lualine.nvim")
	-- fuzzy finding
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
	use({ "nvim-telescope/telescope.nvim", branch = "0.1.x" })
	-- autocompletion
	use("hrsh7th/nvim-cmp")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")
	-- snippets
	use("L3MON4D3/LuaSnip")
	use("saadparwaiz1/cmp_luasnip")
	use("rafamadriz/friendly-snippets")
	-- managing & installing lsp servers, =linters & formatters
	use("williamboman/mason.nvim")
	use("williamboman/mason-lspconfig.nvim")
	-- configuring lsp servers
	use("neovim/nvim-lspconfig")
	use("hrsh7th/cmp-nvim-lsp") -- for autocompletion
	use({ "glepnir/lspsaga.nvim", branch = "main" }) -- enhanced lsp uis
	use("jose-elias-alvarez/typescript.nvim") -- additional functionality for typescript server (e.g. rename file & update imports)
	use("onsails/lspkind.nvim") -- vs-code like icons for autocompletion
	-- formatting & linting
	use("jose-elias-alvarez/null-ls.nvim") -- configure formatters & linters
	use("jayp0521/mason-null-ls.nvim") -- bridges gap b/w mason & null-ls
	-- surroundings
	use("tpope/vim-surround")
	-- git integration
	use("lewis6991/gitsigns.nvim") -- show line modifications on left hand side
	-- markdown preview
	use("ellisonleao/glow.nvim")
	-- treesitter configuration
	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
			ts_update()
		end,
	})
	-- auto cosling
	use("windwp/nvim-ts-autotag")
	use("windwp/nvim-autopairs")
	-- comment
	use("numToStr/Comment.nvim")
	-- sqls.nvim
	use("nanotee/sqls.nvim")

	-- github copilot
	use("github/copilot.vim")

	if packer_bootstrap then
		require("packer").sync()
	end
end)
