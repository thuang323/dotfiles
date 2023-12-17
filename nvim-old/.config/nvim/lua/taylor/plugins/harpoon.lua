local status, harpoon = pcall(require, "harpoon")
if not status then
	return
end

local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

local keymap = vim.keymap

keymap.set("n", "<leader>a", mark.add_file)
keymap.set("n", "<leader>m", ui.toggle_quick_menu)

for i = 1, 9 do
	keymap.set("n", string.format("<leader>%d", i), function()
		ui.nav_file(i)
	end)
end

harpoon.setup()
