require("filetype").setup({
    overrides = {
        extensions = {
			service = "systemd",
			timer = "systemd"
        },
        shebang = {
            dash = "sh",
        },
    },
})
