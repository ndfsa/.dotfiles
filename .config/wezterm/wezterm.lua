local wezterm = require('wezterm')

local function rule(intensity, weight, italic)
    return {
        italic = italic,
        intensity = intensity,
        font = wezterm.font_with_fallback({
            {
                family = 'JetBrains Mono',
                italic = italic,
                weight = weight,
            },
            'Symbols Nerd Font',
            'Symbola',
        }),
    }
end
return {
    font_rules = {
        rule('Half', 'ExtraLight', false),
        rule('Normal', 'Regular', false),
        rule('Bold', 'ExtraBold', false),
        rule('Half', 'ExtraLight', true),
        rule('Normal', 'Regular', true),
        rule('Bold', 'ExtraBold', true),
    },
    font_size = 14,
    enable_tab_bar = true,
    bold_brightens_ansi_colors = true,
    adjust_window_size_when_changing_font_size = false,
    force_reverse_video_cursor = true,
    colors = {
        foreground = '#dcd7ba',
        background = '#1f1f28',

        cursor_bg = '#c8c093',
        cursor_fg = '#c8c093',
        cursor_border = '#c8c093',

        selection_fg = '#c8c093',
        selection_bg = '#2d4f67',

        scrollbar_thumb = '#16161d',
        split = '#16161d',

        ansi = {
            '#090618',
            '#c34043',
            '#76946a',
            '#c0a36e',
            '#7e9cd8',
            '#957fb8',
            '#6a9589',
            '#c8c093',
        },
        brights = {
            '#727169',
            '#e82424',
            '#98bb6c',
            '#e6c384',
            '#7fb4ca',
            '#938aa9',
            '#7aa89f',
            '#dcd7ba',
        },
        indexed = { [16] = '#ffa066', [17] = '#ff5d62' },
    },
}
