return {
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "hrsh7th/cmp-path",
            "L3MON4D3/LuaSnip",
            "saadparwaiz1/cmp_luasnip",
            "hrsh7th/cmp-nvim-lsp",
            "onsails/lspkind.nvim",
        },
        config = function()
            local cmp = require("cmp")

            cmp.setup({
                --[[formatting = {
                    format = function(_, vim_item)
                        vim_item.kind = require("lspkind").presets.codicons[vim_item.kind]
                        .. "  "
                        .. vim_item.kind
                        return vim_item
                    end,
                },--]]
                formatting = {
                    format = function(entry, item)
                        local icon = require("lspkind").presets.codicons[item.kind] or ""

                        item.kind = icon .. "  " .. item.kind

                        local detail = entry.completion_item.labelDetails.detail or ""
                        item.abbr = item.abbr .. detail
                        item.menu = ""

                        return item
                    end
                },
                snippet = {
                    expand = function(args)
                        require("luasnip").lsp_expand(args.body)
                    end,
                },
                window = {
                    completion = cmp.config.window.bordered(),
                    documentation = cmp.config.window.bordered(),
                },
                mapping = {
                    ['<C-u>'] = cmp.mapping.scroll_docs(-4),
                    ['<C-d>'] = cmp.mapping.scroll_docs(4),
                    ["<C-p>"] = cmp.mapping.select_prev_item(),
                    ["<C-n>"] = cmp.mapping.select_next_item(),
                    ["<C-e>"] = cmp.mapping.abort(),
                    ["<CR>"] = cmp.mapping.confirm({ select = true }),
                    ["<Tab>"] = cmp.mapping.confirm({ select = true }),
                },
                sources = cmp.config.sources({
                    {
                        name = 'nvim_lsp',
                        entry_filter = function(entry, ctx)
                            return require("cmp").lsp.CompletionItemKind.Snippet ~= entry:get_kind()
                        end,
                    },
                    { name = "path" },
                    --{ name = 'luasnip' },
                    }, {
                    { name = 'buffer' },
                })
            })
        end,
    }
}
