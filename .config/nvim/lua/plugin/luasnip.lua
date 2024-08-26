return function()
    require("luasnip.loaders.from_snipmate").lazy_load()
    local luasnip = require("luasnip")

    local opts = require("utils").opts

    vim.keymap.set({ "i", "s" }, "<C-L>", function()
        luasnip.jump(1)
    end, opts("Snippet jump forward"))
    vim.keymap.set({ "i", "s" }, "<C-J>", function()
        luasnip.jump(-1)
    end, opts("Snippet jump backward"))
end
