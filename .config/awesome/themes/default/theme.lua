---------------------------
-- Default awesome theme --
---------------------------

local theme_assets = require("beautiful.theme_assets")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi
local awful = require("awful")

local gfs = require("gears.filesystem")
local themes_path = "~/.config/awesome/themes/"

local naughty = require("naughty")
local theme = {}
math.randomseed(os.time())

--theme.font          = "Ubuntu Mono Nerd Font Mono 13"
theme.font          = "Terminus 14"

-- Image dependent
function scandir(directory)
    local i, t, popen = 0, {}, io.popen
    local pfile = popen("find "..directory.." -type f")
    for filename in pfile:lines() do
        i = i + 1
        t[i] = filename
    end
    pfile:close()
    return t
end

local successColors = false
--function setAccentColors(stdout, stderr, reason, exit_code)
--
--    naughty.notify { text = stdout }
--    local red =    "#cc241d"
--    local green =  "#98971a"
--    local yellow = "#d79921"
--    local blue =   "#458588"
--    local magenta ="#b16286"
--    local cyan =   "#689d6a"
--    --if stdout == "RED" then
--        theme.fg_normal     = "#ebdbb2"
--        theme.bg_focus      = red
--        theme.fg_focus      = "#282828"
--        successColors = true
--    --end
--end

local wp_cache = ""
theme.wallpaper = function(s, change_wallpaper)
    local t = scandir("~/Pictures/Wallpapers")
    if wp_cache == "" or change_wallpaper then
        wp_cache = t[math.random(#t)]
        --wp_cache = t[15]
    end
--    awful.spawn.easy_async("~/.config/awesome/color_picker "..wp_cache,
--    function(stdout, stderr, reason, exit_code)
--        naughty.notify { text = stdout }
--    end)
    return wp_cache
end
    
if not successColors then
    theme.fg_normal     = "#ebdbb2"
    theme.bg_focus      = "#d79921"
    theme.fg_focus      = "#282828"
end

theme.bg_normal     = "#282828e6"
theme.bg_urgent     = "#cc241d"
theme.bg_minimize   = theme.bg_normal
theme.bg_systray    = theme.bg_normal

theme.fg_urgent     = "#ebdbb2"
theme.fg_minimize   = "#ebdbb2"

theme.useless_gap   = dpi(10)
theme.border_width  = dpi(5)
theme.border_normal = theme.bg_normal
theme.border_focus  = theme.bg_focus
theme.border_marked = "#d79921"

-- There are other variable sets
-- overriding the default one when
-- defined, the sets are:
-- taglist_[bg|fg]_[focus|urgent|occupied|empty|volatile]
-- tasklist_[bg|fg]_[focus|urgent]
-- titlebar_[bg|fg]_[normal|focus]
-- tooltip_[font|opacity|fg_color|bg_color|border_width|border_color]
-- mouse_finder_[color|timeout|animate_timeout|radius|factor]
-- prompt_[fg|bg|fg_cursor|bg_cursor|font]
-- hotkeys_[bg|fg|border_width|border_color|shape|opacity|modifiers_fg|label_bg|label_fg|group_margin|font|description_font]
-- Example:
--theme.taglist_bg_focus = "#ff0000"

-- Generate taglist squares:
local taglist_square_size = dpi(4)
theme.taglist_squares_sel = theme_assets.taglist_squares_sel(
    taglist_square_size, theme.fg_normal
)
theme.taglist_squares_unsel = theme_assets.taglist_squares_unsel(
    taglist_square_size, theme.fg_normal
)
theme.taglist_bg_focus = theme.bg_normal
theme.taglist_fg_focus = theme.bg_focus

-- Variables set for theming notifications:
-- notification_font
-- notification_[bg|fg]
-- notification_[width|height|margin]
-- notification_[border_color|border_width|shape|opacity]

-- Variables set for theming the menu:
-- menu_[bg|fg]_[normal|focus]
-- menu_[border_color|border_width]
theme.menu_submenu_icon = themes_path.."default/submenu.png"
theme.menu_height = dpi(15)
theme.menu_width  = dpi(100)

-- You can add as many variables as
-- you wish and access them by using
-- beautiful.variable in your rc.lua
--theme.bg_widget = "#cc0000"

-- Define the image to load
theme.titlebar_close_button_normal = themes_path.."default/titlebar/close_normal.png"
theme.titlebar_close_button_focus  = themes_path.."default/titlebar/close_focus.png"

-- You can use your own layout icons like this:
theme.layout_floating  = themes_path.."default/layouts/floatingw.png"
theme.layout_tilebottom = themes_path.."default/layouts/tilebottomw.png"
theme.layout_tile = themes_path.."default/layouts/tilew.png"

-- Generate Awesome icon:
theme.icon = "~/.config/awesome/themes/default/linux_logo.png"

-- Define the icon theme for application icons. If not set then the icons
-- from /usr/share/icons and /usr/share/icons/hicolor will be used.
theme.icon_theme = nil

return theme

-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80
