return {
    {
        'nvimdev/dashboard-nvim',
        dependencies = {
            'nvim-tree/nvim-web-devicons',
        },
        event = 'VimEnter',
        config = function()
            vim.api.nvim_set_hl(0, "DashboardUpdate", { fg = "#a6da95" })

            require('dashboard').setup({
                theme = "hyper",
                config = {
                    week_header = {
                        enable = true,
                    },
                    shortcut = {
                        { desc = '󰊳 Update', group = 'DashboardUpdate', action = 'Lazy update', key = 'u' },
                    },
                    disable_move = true,
                    packages = { enable = true },
                    project = { enable = true, limit = 8, icon = "󰉓  ", label = "Projects:", action = ":cd " },
                    mru = { limit = 10, icon = "󰈢  ", label = "Files:", cwd_only = true },
                    footer = {},
                },
            })
        end,
    }
}

