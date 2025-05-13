local utils = require("utils")

local lspconfig = {
    "neovim/nvim-lspconfig",
    config = function()
        local capabilities = require('cmp_nvim_lsp').default_capabilities()

        local lspconfig = require("lspconfig")
        lspconfig.lua_ls.setup({
            capabilities = capabilities,
            settings = {
                Lua = {
                    diagnostics = {
                        globals = { "vim" },
                    },
                },
            },
        })
        lspconfig.rust_analyzer.setup({
            capabilities = capabilities,
            on_attach = function(_, bufnr)
                vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
            end,
            settings = {
                ["rust-analyzer"] = {
                    cargo = {
                        allFeatures = true,
                    },
                    -- mostly default but some changes, so just to be safe
                    inlayHints = {
                        bindingModeHints = { enable = false },
                        chainingHints = { enable = true },
                        closingBraceHints = {
                            enable = true,
                            minLines = 25
                        },
                        closureCaptureHints = { enable = false },
                        closureReturnTypeHints = { enable = "never" },
                        closureStyle = "impl_fn",
                        discriminantHints = { enable = "never" },
                        expressionAdjustmentHints = {
                            enable = "never",
                            hideOutsideUnsafe = false,
                            mode = "prefix"
                        },
                        genericParameterHints = {
                            const = { enable = false },
                            lifetime = { enable = false },
                            type = { enable = false },
                        },
                        implicitDrops = { enable = false },
                        lifetimeElisionHints = {
                            enable = "never",
                            useParameterNames = false
                        },
                        maxLength = 25,
                        parameterHints = { enable = false },
                        rangeExclusiveHints = { enable = false },
                        reborrowHints = { enable = false },
                        renderColons = true,
                        typeHints = {
                            enable = false,
                            hideClosureInitialization = false,
                            hideNamedConstructor = false,
                        },
                    },
                },
            },
        })

        vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
        vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
    end,
}

return (not utils.is_nixos()) and {
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = { "lua_ls" },
            })
        end,
    },
    lspconfig,
} or lspconfig
