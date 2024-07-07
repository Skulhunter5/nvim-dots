--[[return  {
    "eoh-bse/minintro.nvim",
    config = true,
    lazy = false,
}--]]

return {
    {
        'nvimdev/dashboard-nvim',
        dependencies = {
            'nvim-tree/nvim-web-devicons',
        },
        event = 'VimEnter',
        config = function()
            local logo = [[                                                   
███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ 
████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ 
██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ 
██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ 
██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ 
╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ 
                                                   ]]
            logo = string.rep("\n", 8) .. logo .. "\n\n"


            require('dashboard').setup({
                theme = "hyper",
                config = {
                    --[[week_header = {
                        enable = true,
                    },--]]
                    header = vim.split(logo, "\n"),
                    shortcut = {
                        { desc = '󰊳 Update', group = '@property', action = 'Lazy update', key = 'u' },
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

