from subprocess import call
from libqtile import bar
from libqtile import widget

"""
This is a custom widget that sorts wallpapers in two categories:
    - SAFE
    - NSFW
The MIXD mode consists of the union of the two categories, with the default
keybindigns of:
    LMB: change wallpaper
    RMB: change state and wallpaper

feh program is required and a specific Wallpapers folder structure:
    ~/Pictures/Wallpapers
        |-> safe    # safe wallpapers go here
        |-> nsfw    # nsfw wallpapers go here
"""
class CustomWallpaper(widget.TextBox):
    class State:
        NSFW = 'NSFW'
        SAFE = 'SAFE'
        MIXD = 'MIXD'

    def __init__(self, home="", **config):
        self.current_state = self.State.SAFE
        super().__init__(text="[ " + self.current_state + " ]", width=bar.CALCULATED, **config)
        super().add_defaults(CustomWallpaper.defaults)
        self.home = home
        self.mouse_callbacks = {
                "Button1": self.cmd_change_wallpaper,
                "Button3": self._swap_current_state
                }

    def cmd_change_wallpaper(self, qtile=None):
        postfix = ""
        if self.current_state is self.State.NSFW:
            postfix = "nsfw/" 
        elif self.current_state is self.State.SAFE:
            postfix = "safe/" 
        call(["feh","--bg-fill", "--randomize", "--recursive",
                self.home + "/Pictures/Wallpapers/" + postfix])

    def _swap_current_state(self, qtile=None):
        if self.current_state is self.State.MIXD:
            self.current_state = self.State.SAFE
        elif self.current_state is self.State.NSFW:
            self.current_state = self.State.MIXD
        elif self.current_state is self.State.SAFE:
            self.current_state = self.State.NSFW
        self.text = "[ " + self.current_state + " ]"
        self.draw()
        self.cmd_change_wallpaper()

