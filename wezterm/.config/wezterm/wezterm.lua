local wezterm = require "wezterm"
local colors = require "colors"
local act = wezterm.action

local config = wezterm.config_builder()

config.default_workspace = "taylorhuang"
config.front_end = "WebGpu"
config.freetype_load_flags = "NO_HINTING"


-- The filled in variant of the < symbol
local SOLID_LEFT_ARROW = wezterm.nerdfonts.pl_right_hard_divider

-- The filled in variant of the > symbol
local SOLID_RIGHT_ARROW = wezterm.nerdfonts.pl_left_hard_divider

-- This function returns the suggested title for a tab.
-- It prefers the title that was set via `tab:set_title()`
-- or `wezterm cli set-tab-title`, but falls back to the
-- title of the active pane in that tab.
local function tab_title(tab_info)
  local title = tab_info.tab_title
  -- if the tab title is explicitly set, take that
  if title and #title > 0 then
    return title
  end
  -- Otherwise, use the title from the active pane
  -- in that tab
  return tab_info.active_pane.title
end

wezterm.on(
  "format-tab-title",
  function(tab, tabs, panes, config, hover, max_width)
    -- tab: the TabInformation for the active tab
    -- tabs: an array containing TabInformation for each of the tabs in the window
    -- panes: an array containing PaneInformation for each of the panes in the active tab
    -- config: the effective configuration for the window
    -- hover: true if the current tab is in the hover state
    -- max_width: the maximum number of cells available to draw this tab when using the retro tab bar style.

    local edge_background = "#0b0022"
    -- inactive tab background and foreground
    local background = "#191919"
    local foreground = "#848484"

    if tab.is_active then
      background = "#323233"
      foreground = colors.fg
    elseif hover then
      background = "#282829"
      foreground = "#ababab"
    end

    local edge_foreground = background

    local title = tab_title(tab)

    -- ensure that the titles fit in the available space,
    -- and that we have room for the edges.
    title = wezterm.truncate_right(title, max_width - 2)

    return {
      { Background = { Color = edge_background } },
      { Foreground = { Color = edge_foreground } },
      { Text = SOLID_LEFT_ARROW },
      { Background = { Color = background } },
      { Foreground = { Color = foreground } },
      { Text = title },
      { Background = { Color = edge_background } },
      { Foreground = { Color = edge_foreground } },
      { Text = SOLID_RIGHT_ARROW },
    }
  end
)

-- window and tab
config.window_background_opacity = 0.93
config.macos_window_background_blur = 25
-- config.enable_scroll_bar = false
-- config.hide_tab_bar_if_only_one_tab = false
-- config.window_decorations = "INTEGRATED_BUTTONS|RESIZE"
-- config.tab_bar_at_bottom = false
config.enable_scroll_bar = true
config.hide_tab_bar_if_only_one_tab = true
config.window_decorations = "RESIZE"
config.tab_bar_at_bottom = true
config.show_tab_index_in_tab_bar = true
config.window_padding = {
  bottom = 6,
  top    = 6,
  left   = 5,
  right  = 5
}


-- font
-- use the below line to check font type
-- wezterm ls-fonts --list-system
config.adjust_window_size_when_changing_font_size = false
config.font_size = 14
config.cell_width = 0.95
config.font = wezterm.font_with_fallback {
  { family = "SFMono Nerd Font", weight = "Medium" },
  { family = "JetBrains Mono",   stretch = "Condensed", weight = "Medium" },
  { family = "SF Pro" },
  -- { family = "Hack Nerd Font", weight = "Regular" },
}


-- colors
config.bold_brightens_ansi_colors = "No"
config.colors = {
  ansi = colors.ansi,
  brights = colors.brights,
  background = colors.bg,
  foreground = colors.fg,
  selection_bg = colors.grey,
  -- selection_bg = colors.selection_bg,
  selection_fg = colors.selection_fg,
  cursor_bg = colors.cursor_bg,
  cursor_fg = colors.cursor_fg,
  cursor_border = colors.cursor_border,
  scrollbar_thumb = colors.grey,
  split = colors.split,
  visual_bell = colors.selection_bg,
  indexed = colors.indexed,
}


-- keys
config.disable_default_key_bindings = true
config.keys = {
  -- app
  { key = "r",         mods = "SUPER",       action = act.ReloadConfiguration },
  { key = "h",         mods = "SUPER",       action = act.HideApplication },
  { key = "q",         mods = "SUPER",       action = act.QuitApplication },

  -- shell
  { key = "t",         mods = "SUPER",       action = act.SpawnTab "CurrentPaneDomain" },
  { key = "w",         mods = "SUPER",       action = act.CloseCurrentTab { confirm = true } },
  { key = "n",         mods = "SUPER",       action = act.SpawnWindow },

  -- edit
  { key = "c",         mods = "SUPER",       action = act.CopyTo "Clipboard" },
  { key = "v",         mods = "SUPER",       action = act.PasteFrom "Clipboard" },
  { key = "k",         mods = "SUPER",       action = act.ClearScrollback "ScrollbackOnly" },
  { key = "x",         mods = "SHIFT|CTRL",  action = act.ActivateCopyMode },
  { key = "p",         mods = "SHIFT|SUPER", action = act.ActivateCommandPalette },
  { key = "f",         mods = "SUPER",       action = act.Search "CurrentSelectionOrEmptyString" },

  -- view
  { key = "-",         mods = "SUPER",       action = act.DecreaseFontSize },
  { key = "=",         mods = "SUPER",       action = act.IncreaseFontSize },
  { key = "0",         mods = "SUPER",       action = act.ResetFontSize },
  { key = "Enter",     mods = "ALT",         action = act.ToggleFullScreen },

  -- window
  { key = "m",         mods = "SUPER",       action = act.Hide },
  { key = "1",         mods = "SUPER",       action = act.ActivateTab(0) },
  { key = "2",         mods = "SUPER",       action = act.ActivateTab(1) },
  { key = "3",         mods = "SUPER",       action = act.ActivateTab(2) },
  { key = "4",         mods = "SUPER",       action = act.ActivateTab(3) },
  { key = "5",         mods = "SUPER",       action = act.ActivateTab(4) },
  { key = "6",         mods = "SUPER",       action = act.ActivateTab(5) },
  { key = "7",         mods = "SUPER",       action = act.ActivateTab(6) },
  { key = "8",         mods = "SUPER",       action = act.ActivateTab(7) },
  { key = "9",         mods = "SUPER",       action = act.ActivateTab(-1) },

  -- other
  { key = "l",         mods = "SHIFT|CTRL",  action = act.ShowDebugOverlay },
  -- { key = "Backspace", mods = "SUPER",       action = act.SendString "\x15" },
  { key = "Backspace", mods = "SUPER",       action = act.SendKey { key = "u", mods = "CTRL" } },
  { key = "j",         mods = "SUPER",       action = act.SendKey { key = "\\", mods = "ALT" } },
  { key = "b",         mods = "SUPER",       action = act.SendKey { key = "b", mods = "ALT" } },
  { key = "a",         mods = "SUPER",       action = act.SendKey { key = "a", mods = "ALT" } },
  { key = "/",         mods = "SUPER",       action = act.SendKey { key = "/", mods = "ALT" } },
}


config.key_tables = {
  copy_mode = {
    { key = "Tab",    mods = "NONE",  action = act.CopyMode "MoveForwardWord" },
    { key = "Tab",    mods = "SHIFT", action = act.CopyMode "MoveBackwardWord" },
    { key = "Enter",  mods = "NONE",  action = act.CopyMode "MoveToStartOfNextLine" },
    { key = "Escape", mods = "NONE",  action = act.CopyMode "Close" },
    { key = "$",      mods = "NONE",  action = act.CopyMode "MoveToEndOfLineContent" },
    { key = ",",      mods = "NONE",  action = act.CopyMode "JumpReverse" },
    { key = "0",      mods = "NONE",  action = act.CopyMode "MoveToStartOfLine" },
    { key = ";",      mods = "NONE",  action = act.CopyMode "JumpAgain" },
    { key = "F",      mods = "NONE",  action = act.CopyMode { JumpBackward = { prev_char = false } } },
    { key = "G",      mods = "NONE",  action = act.CopyMode "MoveToScrollbackBottom" },
    { key = "H",      mods = "NONE",  action = act.CopyMode "MoveToViewportTop" },
    { key = "L",      mods = "NONE",  action = act.CopyMode "MoveToViewportBottom" },
    { key = "M",      mods = "NONE",  action = act.CopyMode "MoveToViewportMiddle" },
    { key = "O",      mods = "NONE",  action = act.CopyMode "MoveToSelectionOtherEndHoriz" },
    { key = "T",      mods = "NONE",  action = act.CopyMode { JumpBackward = { prev_char = true } } },
    { key = "_",      mods = "NONE",  action = act.CopyMode "MoveToStartOfLineContent" },
    { key = "b",      mods = "NONE",  action = act.CopyMode "MoveBackwardWord" },
    { key = "b",      mods = "ALT",   action = act.CopyMode "MoveBackwardWord" },
    { key = "b",      mods = "CTRL",  action = act.CopyMode "PageUp" },
    { key = "c",      mods = "CTRL",  action = act.CopyMode "Close" },
    { key = "d",      mods = "CTRL",  action = act.CopyMode { MoveByPage = (0.5) } },
    { key = "e",      mods = "NONE",  action = act.CopyMode "MoveForwardWordEnd" },
    { key = "f",      mods = "NONE",  action = act.CopyMode { JumpForward = { prev_char = false } } },
    { key = "f",      mods = "ALT",   action = act.CopyMode "MoveForwardWord" },
    { key = "f",      mods = "CTRL",  action = act.CopyMode "PageDown" },
    { key = "g",      mods = "NONE",  action = act.CopyMode "MoveToScrollbackTop" },
    { key = "h",      mods = "NONE",  action = act.CopyMode "MoveLeft" },
    { key = "i",      mods = "NONE",  action = act.CopyMode "Close" },
    { key = "j",      mods = "NONE",  action = act.CopyMode "MoveDown" },
    { key = "k",      mods = "NONE",  action = act.CopyMode "MoveUp" },
    { key = "l",      mods = "NONE",  action = act.CopyMode "MoveRight" },
    { key = "o",      mods = "NONE",  action = act.CopyMode "MoveToSelectionOtherEnd" },
    { key = "t",      mods = "NONE",  action = act.CopyMode { JumpForward = { prev_char = true } } },
    { key = "u",      mods = "CTRL",  action = act.CopyMode { MoveByPage = (-0.5) } },
    { key = "v",      mods = "NONE",  action = act.CopyMode { SetSelectionMode = "Cell" } },
    { key = "v",      mods = "SHIFT", action = act.CopyMode { SetSelectionMode = "Line" } },
    { key = "v",      mods = "CTRL",  action = act.CopyMode { SetSelectionMode = "Block" } },
    { key = "w",      mods = "NONE",  action = act.CopyMode "MoveForwardWord" },
    {
      key = "y",
      mods = "NONE",
      action = act.Multiple { { CopyTo = "ClipboardAndPrimarySelection" }, { CopyMode = "Close" } }
    },
    { key = "PageUp",     mods = "NONE", action = act.CopyMode "PageUp" },
    { key = "PageDown",   mods = "NONE", action = act.CopyMode "PageDown" },
    { key = "End",        mods = "NONE", action = act.CopyMode "MoveToEndOfLineContent" },
    { key = "Home",       mods = "NONE", action = act.CopyMode "MoveToStartOfLine" },
    { key = "LeftArrow",  mods = "NONE", action = act.CopyMode "MoveLeft" },
    { key = "LeftArrow",  mods = "ALT",  action = act.CopyMode "MoveBackwardWord" },
    { key = "RightArrow", mods = "NONE", action = act.CopyMode "MoveRight" },
    { key = "RightArrow", mods = "ALT",  action = act.CopyMode "MoveForwardWord" },
    { key = "UpArrow",    mods = "NONE", action = act.CopyMode "MoveUp" },
    { key = "DownArrow",  mods = "NONE", action = act.CopyMode "MoveDown" },
  },

  search_mode = {
    { key = "Enter",     mods = "NONE", action = act.CopyMode "PriorMatch" },
    { key = "Escape",    mods = "NONE", action = act.CopyMode "Close" },
    { key = "n",         mods = "CTRL", action = act.CopyMode "NextMatch" },
    { key = "p",         mods = "CTRL", action = act.CopyMode "PriorMatch" },
    { key = "r",         mods = "CTRL", action = act.CopyMode "CycleMatchType" },
    { key = "l",         mods = "CTRL", action = act.CopyMode "ClearPattern" },
    { key = "c",         mods = "CTRL", action = act.CopyMode "Close" },
    { key = "PageUp",    mods = "NONE", action = act.CopyMode "PriorMatchPage" },
    { key = "PageDown",  mods = "NONE", action = act.CopyMode "NextMatchPage" },
    { key = "UpArrow",   mods = "NONE", action = act.CopyMode "PriorMatch" },
    { key = "DownArrow", mods = "NONE", action = act.CopyMode "NextMatch" },
  },
}


-- others
config.visual_bell = {
  fade_in_function = "Linear",
  fade_in_duration_ms = 100,
  fade_out_function = "Linear",
  fade_out_duration_ms = 100,
}


return config
