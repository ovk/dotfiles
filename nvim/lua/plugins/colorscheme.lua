return {
    'catppuccin/nvim',

    name = 'catppuccin',

    lazy = false,

    priority = 1000,

    config = function ()
        require('catppuccin').setup({
            flavour = 'frappe', -- latte, frappe, macchiato, mocha

            background = {
                light = 'latte',
                dark = 'frappe',
            },

            dim_inactive = {
                enabled = false,
                shade = 'dark',
                percentage = 0.02,
            },

            styles = {
                comments = { 'italic' }, -- Change the style of comments
                conditionals = {},
                loops = {},
                functions = {},
                keywords = {},
                strings = {},
                variables = {},
                numbers = {},
                booleans = {},
                properties = {},
                types = {},
                operators = {},
                -- miscs = {}, -- Uncomment to turn off hard-coded styles
            },

            color_overrides = {},

            custom_highlights = function (colors)
                return {
                    Type = { fg = colors.teal },
                    ["@type.builtin"] = { fg = colors.teal },
                    ["@variable.parameter"] = { link = '@variable' },
                    Function = { link = '@property' },

                    ["@module"] = { fg = colors.lavender, style = {} },

                    SpellBad = { fg = colors.red },

                    gitcommitSummary = { fg = colors.text, style = {} },
                    gitcommitOverflow = { fg = colors.yellow, style = {} },
                    gitcommitUntrackedFile = { fg = colors.subtext1, style = {} },
                    gitcommitDiscardedFile = { fg = colors.mauve, style = {} },
                    gitcommitSelectedFile = { fg = colors.green, style = { 'bold' } },

                    NvimTreeFolderName = { fg = colors.lavender },
                    NvimTreeDiagnosticErrorIcon = { fg = colors.red },
                    NvimTreeDiagnosticWarnIcon = { fg = colors.yellow },
                    NvimTreeDiagnosticInfoIcon = { fg = colors.sky },
                    NvimTreeDiagnosticHintIcon = { fg = colors.teal },

                    MarkSignHL = { fg = colors.yellow, style = { 'bold' } },
                    MarkSignNumHL = { fg = colors.green },

                    AerialClassIcon = { fg = colors.lavender },
                    AerialEnumIcon = { fg = colors.lavender },
                    AerialStructIcon = { fg = colors.lavender },
                    AerialInterfaceIcon = { fg = colors.lavender },
                }
            end,

            integrations = {
                aerial = true,
                fidget = true,
                mason = true,
                cmp = true,
                dap = true,
                dap_ui = true,
                nvimtree = true,
                treesitter = true,
            },
        })

        vim.cmd.colorscheme('catppuccin')
    end
}
