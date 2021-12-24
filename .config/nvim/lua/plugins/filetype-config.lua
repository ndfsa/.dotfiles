require("filetype").setup({
    overrides = {
        extensions = {
			service = "systemd",
			target = "systemd",
			timer = "systemd"
        },
        shebang = {
            sh = "sh",
            dash = "sh",
            bash = "bash",
        },
    },
})
