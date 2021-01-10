from typing import List

import os
import subprocess

from libqtile import bar, layout, widget, hook
from libqtile.config import Click, Drag, Group, Key, Screen
from libqtile.lazy import lazy
from wallpaper import CustomWallpaper

mod = "mod4"
terminal = "alacritty"
home = os.path.expanduser("~")

keys = [
    # Switch between windows in current stack pane
    Key([mod], "j", lazy.layout.down()),
    Key([mod], "k", lazy.layout.up()),
    Key([mod, "shift"], "j", lazy.layout.shuffle_down()),
    Key([mod, "shift"], "k", lazy.layout.shuffle_up()),
    Key([mod, "shift"], "h", lazy.layout.swap_left()),
    Key([mod, "shift"], "l", lazy.layout.swap_right()),
    Key([mod], "i", lazy.layout.grow()),
    Key([mod], "m", lazy.layout.shrink()),
    Key([mod], "n", lazy.layout.reset()),
    Key([mod], "o", lazy.layout.maximize()),
    Key([mod, "shift"], "space", lazy.layout.flip()),

    # Disable floating window
    Key([mod], "t", lazy.window.toggle_floating(),
        desc="Move window up in current stack "),
    # Switch window focus to other pane(s) of stack
    Key(["mod1"], "Tab", lazy.layout.next(),
        desc="Switch window focus to other pane(s) of stack"),
    Key([mod], "Tab", lazy.next_screen(),
        desc="Switch to next window"),

    Key([mod], "Return", lazy.spawn(terminal), desc="Launch terminal"),
    Key([mod, "shift"], "Return", lazy.layout.swap_main(), desc="Launch terminal"),

    # Toggle between different layouts as defined below
    Key([mod], "space", lazy.next_layout(), desc="Toggle between layouts"),
    Key([mod, "shift"], "c", lazy.window.kill(), desc="Kill focused window"),

    Key([mod, "shift"], "r", lazy.restart(), desc="Restart qtile"),
    Key([mod, "shift"], "q", lazy.shutdown(), desc="Shutdown qtile"),
    Key([mod, "shift"], "p", lazy.spawn(home + "/.config/rofi/powermenu/powermenu.sh"), desc="Powermenu"),
    # This keybind might be troublesome, change if required
    Key([mod, "shift"], "w", lazy.spawn("light-locker-command -l"), desc="Lock qtile"),
    
    # Sound
    Key([], "XF86AudioMute", lazy.spawn("amixer -q set Master toggle"),
        desc="Mute master channel"),
    Key([], "XF86AudioLowerVolume", lazy.spawn("amixer -q -c 0 set Master 2dB- -M unmute"),
        desc="Lower master channel volume"),
    Key([], "XF86AudioRaiseVolume", lazy.spawn("amixer -q -c 0 set Master 2dB+ -M unmute"),
        desc="Lower master channel volume"),
    
    # Convinience keybinds
    Key([mod], "r", lazy.spawn("rofi -show drun"), desc="Show rofi runner"),
    Key([mod], "w", lazy.spawn("rofi -show window"), desc="Show rofi window switcher"),

    # Hide Top bar
    Key([mod], "b", lazy.hide_show_bar() , desc="Show rofi runner"),
]

groups = [Group(x) for x in "sys www dev fmg msc idl".split()]

for i, g in enumerate(groups):
    keys.extend([
        # mod1 + letter of group = switch to group
        Key([mod], str(i + 1), lazy.group[g.name].toscreen(toggle=False),
            desc="Switch to group {}".format(g.name)),
        Key([mod, "control"], str(i + 1), lazy.group.focus_by_name(g.name)),
        # mod1 + shift + letter of group = switch to & move focused window to group
        Key([mod, "shift"], str(i + 1), lazy.window.togroup(g.name, switch_group=True),
            desc="Switch to & move focused window to group {}".format(g.name)),
        # Or, use below if you prefer not to switch to that group.
        # # mod1 + shift + letter of group = move focused window to group
        # Key([mod, "shift"], i.name, lazy.window.togroup(i.name),
        #     desc="move focused window to group {}".format(i.name)),
    ])

class Colors():
    foreground = "#abb2bf"
    background = "#282c34"
    black = "#5c6370"
    red = "#e06c75"
    green = "#98c379"
    yellow = "#e5c07b"
    blue = "#61afef"
    magenta = "#c678dd"
    purple = "#a86cc1"
    cyan = "#56b6c2"
    white = "#abb2bf"

layout_theme = {
    "margin": 6,
    "border_width": 4,
    "border_focus": "#a86cc1",
    "border_normal": "#202020"
}

layouts = [
    # layout.Stack(num_stacks=2),
    # Try more layouts by unleashing below layouts.
    #layout.Bsp(**layout_theme),
    # layout.Columns(),
    layout.Max(),
    layout.MonadTall(**layout_theme),
    layout.MonadWide(**layout_theme),
    layout.Floating(**layout_theme),
    # layout.RatioTile(),
    # layout.Tile(),
    # layout.TreeTab(),
    # layout.VerticalTile(),
    # layout.Zoomy(),
]

widget_defaults = dict(
    font='Ubuntu Mono',
    margin_y=6,
    fontsize=15
)
extension_defaults = widget_defaults.copy()
screens = [
    Screen(
        top=bar.Bar(
            [
                widget.Image(
                        filename="~/.config/qtile/icons/logo.png",
                        margin_x=15,
#                        margin_y=6,
                        mouse_callbacks={'Button1': lambda clbk: clbk.cmd_spawn("rofi -show drun")}
                        ),
                widget.GroupBox(
                        disable_drag=True,
                        spacing=5,
                        highlight_method="line",
                        this_current_screen_border=Colors.purple,
                        borderwidth=5,
                        use_mouse_wheel=False
                        ),
                widget.Sep(
                        padding=10
                        ),
                widget.CurrentLayout(
                        fmt='{:^9}'
                        ),
                widget.Sep(
                        padding=10
                        ),
                widget.WindowName(),
                widget.Spacer(),
                widget.Sep(
                        padding=10
                        ),
                widget.Net(
                        interface="ens33",
                        format="{down} ↓↑ {up}",
                        padding=15,
                        ),
                widget.Sep(
                        padding=10
                        ),
                widget.CPU(
                        padding=15,
                        ),
                widget.Sep(
                        padding=10
                        ),
                widget.Memory(
                        padding=15,
                        ),
                widget.Sep(
                        padding=10
                        ),
                #widget.Systray(),
                #widget.Sep(
                #        padding=10
                #        ),
                widget.Volume(
                        padding=20,
                        ),
                widget.Sep(
                        padding=10
                        ),
                widget.Clock(
                        format='%Y-%m-%d %a %H:%M',
                        padding=15,
                        ),
                widget.Sep(
                        padding=10
                        ),
                CustomWallpaper(
                        home=home,
                        padding=15
                        ),
                widget.Sep(
                        padding=5,
                        linewidth = 0,
                        ),
            ], 35, opacity=0.8,
        ),
    ),
    Screen(top=bar.Bar([
            widget.Image(
                        filename="~/.config/qtile/icons/logo.png",
                        margin_x=15,
                        mouse_callbacks={'Button1': lambda clbk: clbk.cmd_spawn("rofi -show drun")}
                        ),
            widget.GroupBox(
                        disable_drag=True,
                        spacing=5,
                        highlight_method="line",
                        this_current_screen_border=Colors.purple,
                        borderwidth=5,
                        use_mouse_wheel=False
                        ),
            ], 35, opacity=0.8
        )
    ),
]

# Drag floating layouts.
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(),
         start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(),
         start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front())
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: List
main = None  # WARNING: this is deprecated and will be removed soon
follow_mouse_focus = False
bring_front_click = False
cursor_warp = False
floating_layout = layout.Floating(float_rules=[
    # Run the utility of `xprop` to see the wm class and name of an X client.
    {'wmclass': 'confirm'},
    {'wmclass': 'dialog'},
    {'wmclass': 'download'},
    {'wmclass': 'error'},
    {'wmclass': 'file_progress'},
    {'wmclass': 'notification'},
    {'wmclass': 'splash'},
    {'wmclass': 'toolbar'},
    {'wmclass': 'confirmreset'},  # gitk
    {'wmclass': 'makebranch'},  # gitk
    {'wmclass': 'maketag'},  # gitk
    {'wname': 'branchdialog'},  # gitk
    {'wname': 'pinentry'},  # GPG key password entry
    {'wmclass': 'ssh-askpass'},  # ssh-askpass
])
auto_fullscreen = True
focus_on_window_activation = "smart"

@hook.subscribe.startup_once
def start_once():
    subprocess.run(home + "/.config/qtile/autostart.sh")

# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "LG3D"
