local telescope_setup, telescope = pcall(require, "telescope")
if not telescope_setup then
	return
end

local actions_setup, actions = pcall(require, "telescope.actions")
if not actions_setup then
	return
end

telescope.setup({
	defaults = {
		mappings = {
			i = {
				["<C-p>"] = actions.move_selection_previous, -- move to previous result
				["<C-n>"] = actions.move_selection_next, -- move to next result
				["<C-j>"] = actions.preview_scrolling_down, -- preview window scrolling down
				["<C-k>"] = actions.preview_scrolling_up, -- preview window scrolling up
				["<C-q"] = actions.send_selected_to_qflist + actions.open_qflist, -- send selected to quickfixlist
			},
		},
	},
})

telescope.load_extension("fzf")
