-- nightfly
-- local nightfly_status, _ = pcall(vim.cmd, "colorscheme nightfly")
-- if not nightfly_status then
-- 	print("Colorscheme not found!")
-- 	return
-- end

-- nightfox
-- local nightfox_status, _ = pcall(vim.cmd, "colorscheme nightfox")
-- if not nightfox_status then
-- 	print("Colorscheme not found!")
-- 	return
-- end

-- onedark
require("onedark").setup({
	style = "deep",
	transparent = false,
	code_style = {
		comments = "italic",
		keywords = "none",
		functions = "italic",
		strings = "none",
		variables = "none",
	},
	highlights = {
		TelescopeNormal = { bg = "#0d0b0b" },
		-- TelescopeBorder = { fg = "", bg = "#0d0b0b" },
		TelescopePromptBorder = { fg = "#0d0b0b", bg = "#101012" },
		TelescopeResultsBorder = { fg = "#0d0b0b", bg = "#101012" },
		TelescopePreviewBorder = { fg = "#0d0b0b", bg = "#101012" },
		TelescopePromptTitle = { fg = "#000000", bg = "#efbd5d" },
		TelescopeResultsTitle = { fg = "#000000", bg = "#db8ad6" },
		TelescopePreviewTitle = { fg = "#000000", bg = "#aae6b2" },
	},
})
require("onedark").load()

-- tokyonight
-- local tokyonight_status, _ = pcall(vim.cmd, "colorscheme tokyonight-moon")
-- if not tokyonight_status then
-- 	print("Colorscheme not found!")
-- 	return
-- end
