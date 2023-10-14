local opts = require("utils").opts

local zk = require("zk")

zk.setup()

vim.keymap.set("n" , "<leader>Jd", function()
    zk.new({ dir = "journal/daily" })
end, opts("Journal daily"))
