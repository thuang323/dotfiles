local setup, neotree = pcall(require, "neo-tree")
if not setup then
	return
end

vim.fn.sign_define("DiagnosticSignError", { text = " ", texthl = "DiagnosticSignError" })
vim.fn.sign_define("DiagnosticSignWarn", { text = " ", texthl = "DiagnosticSignWarn" })
vim.fn.sign_define("DiagnosticSignInfo", { text = " ", texthl = "DiagnosticSignInfo" })
vim.fn.sign_define("DiagnosticSignHint", { text = "󰌵", texthl = "DiagnosticSignHint" })

neotree.setup({
	default_component_configs = {
		git_status = {
			symbols = {
				-- Change type
				added = "", -- NOTE: you can set any of these to an empty string to not show them
				-- added     = "✚", -- NOTE: you can set any of these to an empty string to not show them
				deleted = "✖",
				-- modified  = "",
				modified = "",
				renamed = "󰁕",
				-- Status type
				untracked = "",
				ignored = "",
				unstaged = "󰄱",
				staged = "",
				conflict = "",
			},
		},
	},
	filesystem = {
		filtered_items = {
			hide_dotfiles = false,
			never_show = {
				".DS_Store",
			},
		},
		use_libuv_file_watcher = true,
	},
	window = {
		width = 30,
		mappings = {
			["/"] = "none",
			["."] = "none",
			["O"] = "set_root", -- change to child directory
			["<bs>"] = "navigate_up", -- (backspace) change to child directory
			["z"] = "none",
			["C"] = "close_all_nodes",
			["L"] = "focus_preview",
			["h"] = "close_node",
			["l"] = "open",
			["<CR>"] = "open",
		},
	},
})
