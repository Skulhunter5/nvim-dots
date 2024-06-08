return {
    "nvim-tree/nvim-tree.lua",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    config = function()
        require("nvim-tree").setup({
            sort = {
                sorter = "case_sensitive",
            },
            view = {
                width = {
                    min = 40,
                    max = -1,
                },
                side = "left",
                signcolumn = "yes",
            },
            renderer = {
                group_empty = true,
            },
            filters = {
                enable = true,
                git_ignored = true,
                dotfiles = false,
            },
            git = {
                enable = true,
                show_on_dirs = true,
                show_on_open_dirs = false,
            },
            renderer = {
                indent_markers = {
                    enable = true,
                },
                symlink_destination = true,
                highlight_git = "name",
                highlight_diagnostics = "name",
                icons = {
                    show = {
                        folder_arrow = false,
                    },
                    git_placement = "before",
                    diagnostics_placement = "signcolumn",
                },
            },
            diagnostics = {
                enable = true,
                show_on_dirs = true,
                show_on_open_dirs = false,
            },
        })
        vim.keymap.set("n", "<C-p>", "<cmd> NvimTreeToggle <CR>", { silent = true })
    end,
}
