local wezterm = require("wezterm")

local function rule(intensity, weight, italic)
    return {
        italic = italic,
        intensity = intensity,
        font = wezterm.font_with_fallback({
            {
                family = "JetBrains Mono",
                italic = italic,
                weight = weight,
            },
            "Symbols Nerd Font",
            "Symbola",
        }),
    }
end
local config = {
    font_rules = {
        rule("Half", "ExtraLight", false),
        rule("Normal", "Regular", false),
        rule("Bold", "ExtraBold", false),
        rule("Half", "ExtraLight", true),
        rule("Normal", "Regular", true),
        rule("Bold", "ExtraBold", true),
    },
    default_prog = { '/usr/bin/fish'},
    warn_about_missing_glyphs = false,
    hide_tab_bar_if_only_one_tab = true,
    audible_bell = "Disabled",
    harfbuzz_features = { "calt=0", "clig=0", "liga=0" },
    use_fancy_tab_bar = false,
    initial_rows = 38,
    initial_cols = 120,
    window_padding = {
        left = 0,
        right = 0,
        top = 0,
        bottom = 0,
    },
    font_size = 14,
    enable_tab_bar = true,
    bold_brightens_ansi_colors = true,
    adjust_window_size_when_changing_font_size = false,
    show_new_tab_button_in_tab_bar = false,
    force_reverse_video_cursor = true,
    tab_bar_at_bottom = true,
    colors = {
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
    },
    mouse_bindings = {
        {
            event = { Up = { streak = 1, button = "Left" } },
            mods = "CTRL",
            action = wezterm.action.OpenLinkAtMouseCursor,
        },
        {
            event = { Up = { streak = 1, button = "Right" } },
            action = wezterm.action.CopyTo("ClipboardAndPrimarySelection"),
        },
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
