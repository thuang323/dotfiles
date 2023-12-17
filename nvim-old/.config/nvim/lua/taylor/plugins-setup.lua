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
local packer_bootstrap = ensure_packer() -- true if packer was just install

-- Autocommand that reloads neovim whenever you save this file
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
	use("wbthomason/packer.nvim")

	-- lua functions that many plugins use
	use("nvim-lua/plenary.nvim")

	-- startup dashboard
	use({
		"goolord/alpha-nvim",
		config = function()
			local alpha = require("alpha")
			local dashboard = require("alpha.themes.dashboard")
			dashboard.section.header.val = {
				[[⠀⠀⠀⠀⠀⠀⠀⣀⣀⡰⣋⠉⠲⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
				[[⠀⠀⠀⠀⠀⠀⡼⠶⢬⡏⠉⠙⢦⡘⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
				[[⠀⠀⠀⠀⠀⠀⣇⠀⣤⡇⠀⠀⣶⣷⠈⢲⠒⠲⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
				[[⠀⠀⢀⡠⠴⠒⠚⠒⠚⠻⢄⡀⢙⠿⠂⠀⠑⠂⢇⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
				[[⠀⡴⠋⠀⡠⠄⠀⠀⠀⠀⠀⠈⠃⠀⠀⠀⠀⠀⠀⢯⠑⡆⠀⠀⢠⠒⡦⠀⡀⠀]],
				[[⡼⠀⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⡜⢿⠙⢦⡼⠠⡷⠋⡹⠀]],
				[[⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⠀⠀⠀⠀⠀⠀⢸⢆⠀⢷⠈⠑⠀⠈⠿⠒⢲]],
				[[⢱⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢢⣀⠀⠀⠀⠀⣏⡨⢂⡸⠀⠀⠀⢀⡴⠛⠉]],
				[[⠈⢧⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣰⠁⠀⡏⠀⢀⢮⢀⠔⠉⢀⡴⠛⠛⠉⠀⠀⠀]],
				[[⠀⠀⠑⢤⣀⠀⠀⠀⢀⣀⠴⢏⢻⠀⡰⠁⢀⠀⠸⠁⠀⢠⠋⠀⢀⠀⠀⠀⠀⠀]],
				[[⠀⠀⠀⠀⢨⠭⠭⢭⣁⣀⣀⣈⠦⢄⡤⠐⠁⠀⠀⠀⢰⣇⣻⡞⠉⢧⠀⠀⠀⠀]],
				[[⠀⠀⣰⠒⠚⠒⠤⣀⠀⠀⠀⠀⢀⡾⠀⠀⠀⠀⠀⠀⠈⠓⠵⠃⠀⢸⡀⠀⠀⠀]],
				[[⠀⠀⢘⡶⠒⠒⢈⠆⠀⠀⢀⠞⠉⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⠇⠀⠀⠀]],
				[[⠀⠀⠈⠳⠒⡎⠁⡠⠊⠉⠁⠀⠀⣧⠀⠀⠀⠀⠀⠀⢠⠃⠀⠀⠀⡼⠀⠀⠀⠀]],
				[[⠀⠀⠀⠀⠀⠉⠉⣠⠖⠲⠦⡀⢀⡼⣆⠀⠀⠀⠀⠀⡆⠀⠀⠀⠐⣅⡀⠀⠀⠀]],
				[[⠀⠀⠀⠀⠀⠀⢸⡗⢲⡦⣄⠙⢞⡒⢬⡳⣤⣀⣀⣀⣰⡄⠀⠀⠀⠇⠏⠻⢢⠀]],
				[[⠀⠀⠀⠀⠀⠀⠘⣆⠀⠈⠑⢵⡄⠀⢀⡻⠁⠀⠉⠀⠀⠈⠳⠶⡦⢐⠀⠀⠱⢂]],
				[[⠀⠀⠀⠀⠀⠀⠀⠈⠓⠦⢤⡬⠻⡶⣌⡇⠀⠀⠀⠀⠀⠀⠀⠀⢸⠁⠀⠀⠀⡏]],
				[[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠑⠤⠼⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⢄⣀⣀⣔⡕]],
			}

			dashboard.section.buttons.val = {
				dashboard.button("SPC er", " > Toggle file explorer", ":Neotree toggle<CR>"),
				dashboard.button("SPC sf", "󰱼 > Find File", "<cmd>Telescope find_files<CR>"),
				dashboard.button("SPC so", "󱋡 > Find Old Files", "<cmd>Telescope oldfiles<CR>"),
				dashboard.button("SPC fs", " > Find Word", "<cmd>Telescope live_grep<CR>"),
				dashboard.button("SPC sc", " > Switch Color", "<cmd>Telescope colorscheme<CR>"),
				dashboard.button("q", " > Quit NVIM", "<cmd>qa<CR>"),
			}

			dashboard.config.opts.noautocmd = true
			alpha.setup(dashboard.config)
		end,
	})

	-- colorscheme
	use("bluz71/vim-nightfly-guicolors")
	-- use("EdenEast/nightfox.nvim")
	-- use("folke/tokyonight.nvim")
	use("navarasu/onedark.nvim")

	-- tmux & split window navigation
	use("christoomey/vim-tmux-navigator")

	-- better resize current window
	use("anuvyklack/hydra.nvim")

	-- bufferline for tabs in vim
	use({ "akinsho/bufferline.nvim", tag = "*", requires = "nvim-tree/nvim-web-devicons" })

	-- maximizes and restores current window
	-- use("szw/vim-maximizer")

	-- essential plugins
	use("tpope/vim-surround") -- ys: can use it to surround with the characters you want
	-- ds: can delete the characters surround
	-- cs: change the characteres surround
	use("vim-scripts/ReplaceWithRegister") -- grw: can paste the word you have copied

	-- smooth scrolling
	use("karb94/neoscroll.nvim")

	-- commenting codes
	use("numToStr/Comment.nvim") -- 'gcc' to comment a line
	-- visual mode use 'gc' to comment a chunk of lines

	-- file explorer
	-- use({ "nvim-tree/nvim-tree.lua", requires = "nvim-tree/nvim-web-devicons" })
	use({
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		requires = {
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
			{
				"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
				config = function()
					require("nvim-web-devicons").set_icon({
						[".s"] = {
							icon = "",
							color = "#ff6f3f",
							name = "Assembly",
						},
					})
				end,
			},
		},
	})

	-- vs-code like icons
	-- use("kyazdani42/nvim-web-devicons")
	use({
		"nvim-tree/nvim-web-devicons",
	})

	-- statusline
	use({ "nvim-lualine/lualine.nvim", requires = "nvim-tree/nvim-web-devicons" })

	-- fuzzy finding
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" }) -- dependency for better sorting performance
	use({ "nvim-telescope/telescope.nvim", branch = "0.1.x" }) -- fuzzy finder

	-- harpoon
	use({ "ThePrimeagen/harpoon", requires = "nvim-tree/nvim-web-devicons" })

	-- autocompletion
	use({
		"hrsh7th/nvim-cmp",
		requires = {
			{ "kdheepak/cmp-latex-symbols" },
		},
	})
	use("hrsh7th/cmp-buffer") -- buffer completion: source for text in buffer
	use("hrsh7th/cmp-path") -- path completion: source for file system paths
	use("hrsh7th/cmp-cmdline") -- cmdline completions
	use("hrsh7th/cmp-nvim-lsp") -- lsp autocompletion
	use("saadparwaiz1/cmp_luasnip") -- for snippets autocompletion
	use("onsails/lspkind.nvim") -- vs-code like icons for autocompletion

	-- snippets
	use("L3MON4D3/LuaSnip") -- snippet engine
	use("rafamadriz/friendly-snippets") -- useful snippets

	-- managing & installing lsp servers, linters & formatters
	use("williamboman/mason.nvim") -- in charge of managing lsp servers, linters & formatters
	use("williamboman/mason-lspconfig.nvim") -- bridges gap b/w mason & lspconfig

	-- configuring lsp servers
	use("neovim/nvim-lspconfig") -- easily configure language servers

	-- lsp loading
	use("j-hui/fidget.nvim")

	-- UI for using telescope for code action
	use("stevearc/dressing.nvim")

	-- formatting & linting
	use("jose-elias-alvarez/null-ls.nvim") -- configure formatters & linters
	use("jayp0521/mason-null-ls.nvim") -- bridges gap b/w mason & null-ls

	-- toggleterm
	use("akinsho/toggleterm.nvim")

	-- treesitter configuration
	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
			ts_update()
		end,
	})

	-- auto closing
	use("windwp/nvim-autopairs") -- autoclose parens, brackets, quotes, etc...
	use("windwp/nvim-ts-autotag") -- autoclose tags

	-- git signs plugin
	use("lewis6991/gitsigns.nvim")

	-- lazy git
	-- nvim v0.7.2
	use({
		"kdheepak/lazygit.nvim",
		-- optional for floating window border decoration
		requires = {
			"nvim-lua/plenary.nvim",
		},
	})

	-- undo tree
	use("mbbill/undotree")

	-- vimtex:
	-- <localleader> ll -> to compile
	-- <localleader> lv -> to view
	-- <localleader> lk -> to stop
	use({
		"lervag/vimtex",
		ft = "tex",
		config = function()
			vim.cmd([[
        let maplocalleader = ' '
        let g:vimtex_view_method = 'sioyek'
        let g:vimtex_quickfix_open_on_warning = 0
        let g:vimtex_format_enabled = 1
      ]])
		end,
	})

	use("folke/which-key.nvim")

	if packer_bootstrap then
		require("packer").sync()
	end
end)
