return {
    "catppuccin/nvim",
    lazy = false,
    name = "catppuccin",
    priority = 1000,
    config = function ()
        require("catppuccin").setup({
            flavour = "macchiato",
            default_integrations = false,
            integrations = {
                nvimtree = true,
                treesitter = true,
            }
        })
        vim.cmd.colorscheme "catppuccin"
    end,
}
