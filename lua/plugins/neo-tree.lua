return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    config = function ()
        require("neo-tree").setup({
            enable_git_status = true,
            enable_diagnostics = true,
            window = {
                width = 40,
            },
        })

        local command = require("neo-tree.command")
        vim.keymap.set("n", "<C-p>", function ()
            command.execute({
                action = "focus",
                source = "filesystem",
                position = "left",
                toggle = true,
                reveal = true,
            })
        end, {})
    end,
}
