local wezterm = require 'wezterm';
function rule(intensity, weight, italic)
    return {
        italic = italic,
        intensity = intensity,
        font = wezterm.font_with_fallback({
            {
                family = "JetBrains Mono",
                italic = italic,
                weight = weight
            },
            "Symbols Nerd Font",
        }),
    }
end
return {
    font_rules= {
        rule("Half", "ExtraLight", false),
        rule("Normal", "Regular", false),
        rule("Bold", "ExtraBold", false),
        rule("Half", "ExtraLight", true),
        rule("Normal", "Regular", true),
        rule("Bold", "ExtraBold", true),
    },
    window_padding = {
        left = 2,
        right = 2,
        top = 0,
        bottom = 0,
    },
    font_size = 14,
    window_background_opacity = 0.90,
    enable_tab_bar = false,
    bold_brightens_ansi_colors = true,
    adjust_window_size_when_changing_font_size = false,

    colors = {
        foreground = "#ebdbb2",
        background = "#1e1e1e",
        cursor_bg = "#ebdbb2",
        cursor_fg = "#1e1e1e",
        cursor_border = "#ebdbb2",
        selection_fg = "#534a42",
        selection_bg = "#ebdbb2",
        ansi = {
            '#282828',
            '#cc241d',
            '#98971a',
            '#d79921',
            '#458588',
            '#b16286',
            '#689d6a',
            '#a89984',
        },
        brights = {
            '#928374',
            '#fb4934',
            '#b8bb26',
            '#fabd2f',
            '#83a598',
            '#d3869b',
            '#8ec07c',
            '#ebdbb2',
        },
        scrollbar_thumb = "#222222",
        split = "#444444",
        compose_cursor = "orange",
    }
}
