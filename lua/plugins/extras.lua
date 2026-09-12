return {
    {
        "echasnovski/mini.indentscope",
        event = { "BufReadPost", "BufNewFile" },
        opts = { symbol = "│", options = { try_as_border = true } },
    },
    {
        "brenoprata10/nvim-highlight-colors",
        event = { "BufReadPost", "BufNewFile" },
        opts = { render = "background" },
    },
    {
        "nvim-mini/mini.surround",
        event = { "BufReadPost", "BufNewFile" },
        opts = {},
    },
    {
        "folke/todo-comments.nvim",
        event = { "BufReadPost", "BufNewFile" },
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = {},
    },
    {
        "abecodes/tabout.nvim",
        event = "InsertEnter",
        priority = 1000,
        dependencies = { "nvim-treesitter/nvim-treesitter" },
        opts = {
            tabkey = "<Tab>",
            backwards_tabkey = "<S-Tab>",
            act_as_tab = true,
            act_as_shift_tab = false,
            default_tab = "<C-t>",
            default_shift_tab = "<C-d>",
            enable_backwards = true,
            completion = true,
            tabouts = {
                { open = "'", close = "'" },
                { open = '"', close = '"' },
                { open = "`", close = "`" },
                { open = "(", close = ")" },
                { open = "[", close = "]" },
                { open = "{", close = "}" },
            },
            ignore_beginning = true,
            exclude = {},
        },
    },
    {
        "nat-418/boole.nvim",
        event = { "BufReadPost", "BufNewFile" },
        opts = {
            mappings = {
                increment = "<C-a>",
                decrement = "<C-x>",
            },
            additions = {
                { "true", "false" },
                { "True", "False" },
                { "yes", "no" },
                { "on", "off" },
                { "enable", "disable" },
                { "enabled", "disabled" },
                { "left", "right" },
                { "up", "down" },
            },
        },
    },
    {
        "MeanderingProgrammer/render-markdown.nvim",
        -- dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-mini/mini.nvim" }, -- if you use the mini.nvim suite
        dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-mini/mini.icons" }, -- if you use standalone mini plugins
        -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
        ---@module 'render-markdown'
        ---@type render.md.UserConfig
        opts = {},
    },
    {
        "j-hui/fidget.nvim",
        event = "LspAttach",
        opts = {
            progress = {
                display = {
                    render_limit = 16,
                    done_ttl = 3,
                },
            },
            notification = {
                window = {
                    winblend = 0,
                },
            },
        },
    },
    {
        "kosayoda/nvim-lightbulb",
        event = "LspAttach",
        opts = {
            autocmd = { enabled = true },
            sign = {
                enabled = true,
                text = "󱠀",
                hl = "LightBulbSign",
            },
            virtual_text = {
                enabled = false,
                text = "󱠀",
            },
        },
    },
    {
        "Bekaboo/dropbar.nvim",
        event = "BufReadPre",
    },
}
