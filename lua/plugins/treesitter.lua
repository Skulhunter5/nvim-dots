return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function ()
        require("nvim-treesitter.configs").setup({
            ensure_installed = { "lua", "vimdoc" },
            -- vimdoc necessary to prevent problems with ":h ..."
            -- might also want: java, c, cpp, rust, html, css, javascript, yaml, python, nasm, markdown, bash
            -- list of parsers: https://github.com/nvim-treesitter/nvim-treesitter/wiki/List-of-parsers
            sync_install = false,
            highlight = { enable = true },
            indent = { enable = true },
        })
    end,
}
