require("filetype").setup({
    overrides = {
        extensions = {
            service = "systemd",
            target = "systemd",
            timer = "systemd"
        },
        shebang = {
            sh = "sh",
            zsh = "zsh",
            dash = "sh",
            bash = "bash",
        },
    },
})
