local wezterm = require("wezterm")

local function font_rule(font, weight, italic)
    return wezterm.font_with_fallback({
        {
            family = font,
            weight = weight,
            italic = italic,
        },
        "Symbols Nerd Font",
    })
end

-- local font_family = "Monaspace Neon"
-- local font_family = "Monaspace Argon"
-- local font_family = "Monaspace Xenon"
local font_family = "Monaspace Radon"
-- local font_family = "Monaspace Krypton"
-- local font_family = "JetBrains Mono"
local config = {}

config.font = font_rule(font_family, "Regular", false)
config.font_rules = {
    {
        italic = false,
        intensity = "Half",
        font = font_rule(font_family, "ExtraLight", false),
    },
    {
        italic = true,
        intensity = "Half",
        font = font_rule(font_family, "ExtraLight", true),
    },
    {
        italic = false,
        intensity = "Normal",
        font = font_rule(font_family, "Regular", false),
    },
    {
        italic = true,
        intensity = "Normal",
        font = font_rule(font_family, "Regular", true),
    },
    {
        italic = false,
        intensity = "Bold",
        font = font_rule(font_family, "ExtraBold", false),
    },
    {
        italic = true,
        intensity = "Bold",
        font = font_rule(font_family, "ExtraBold", true),
    },
}
config.warn_about_missing_glyphs = false
config.hide_tab_bar_if_only_one_tab = true
config.audible_bell = "Disabled"
config.harfbuzz_features = {
    "calt",
    "liga",
    "ss01",
    "ss02",
    "ss03",
    "ss04",
    "ss05",
    "ss06",
    "ss07",
    "ss08",
    "ss09",
}
config.use_fancy_tab_bar = false
config.initial_rows = 40
config.initial_cols = 120
config.window_padding = {
    left = 0,
    right = 0,
    top = 0,
    bottom = 0,
}
config.font_size = 14
config.enable_tab_bar = true
config.bold_brightens_ansi_colors = true
config.adjust_window_size_when_changing_font_size = false
config.show_new_tab_button_in_tab_bar = false
config.force_reverse_video_cursor = true
config.tab_bar_at_bottom = true
config.colors = {
    foreground = "#dcd7ba",
    background = "#1f1f28",
    cursor_bg = "#c8c093",
    cursor_fg = "#c8c093",
    cursor_border = "#c8c093",
    selection_fg = "#c8c093",
    selection_bg = "#2d4f67",
    scrollbar_thumb = "#16161d",
    split = "#16161d",
    ansi = {
        "#090618",
        "#c34043",
        "#76946a",
        "#c0a36e",
        "#7e9cd8",
        "#957fb8",
        "#6a9589",
        "#c8c093",
    },
    brights = {
        "#727169",
        "#e82424",
        "#98bb6c",
        "#e6c384",
        "#7fb4ca",
        "#938aa9",
        "#7aa89f",
        "#dcd7ba",
    },
    indexed = { [16] = "#ffa066", [17] = "#ff5d62" },
    tab_bar = {
        background = "#98bb6c",
        active_tab = {
            bg_color = "#98bb6c",
            fg_color = "#1f1f28",
            intensity = "Bold",
        },
        inactive_tab = {
            bg_color = "#98bb6c",
            fg_color = "#727169",
        },
        inactive_tab_hover = {
            bg_color = "#7e9cd8",
            fg_color = "#1f1f28",
        },
    },
}
config.mouse_bindings = {
    {
        event = { Up = { streak = 1, button = "Left" } },
        mods = "CTRL",
        action = wezterm.action.OpenLinkAtMouseCursor,
    },
    {
        event = { Up = { streak = 1, button = "Right" } },
        action = wezterm.action.CopyTo("ClipboardAndPrimarySelection"),
    },
}
config.keys = {
    {
        key = "t",
        mods = "ALT",
        action = wezterm.action.SpawnTab("CurrentPaneDomain"),
    },
    { key = "{", mods = "SHIFT|ALT", action = wezterm.action.MoveTabRelative(-1) },
    { key = "}", mods = "SHIFT|ALT", action = wezterm.action.MoveTabRelative(1) },
    { key = "[", mods = "ALT", action = wezterm.action.ActivateTabRelative(-1) },
    { key = "]", mods = "ALT", action = wezterm.action.ActivateTabRelative(1) },
}
for i = 1, 9 do
    table.insert(config.keys, {
        key = tostring(i),
        mods = "ALT",
        action = wezterm.action_callback(function(win, pane)
            local mux = win:mux_window()

            if #mux:tabs() + 1 == i then
                mux:spawn_tab({})
            end

            win:perform_action(wezterm.action.ActivateTab(i - 1), pane)
        end),
    })
end
return config
