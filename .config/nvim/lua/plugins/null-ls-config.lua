local null = require('null-ls')
null.setup({
    sources = {
        null.builtins.formatting.stylua,
        null.builtins.formatting.black,
        null.builtins.formatting.clang_format,
        null.builtins.formatting.rustfmt,
        null.builtins.formatting.prettier,
        null.builtins.formatting.zigfmt,
    },
})
