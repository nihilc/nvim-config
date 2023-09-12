return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    dependencies = {
        "nvim-treesitter/nvim-treesitter-textobjects",
    },
    event = "VeryLazy",
    main = "nvim-treesitter.configs",
    opts = {
        ensure_installed = {
            -- Web
            "html",
            "css",
            "javascript",
            "typescript",
            "json",

            -- Languages
            "lua",
            "vim",
            "bash",
            "c",
            "cpp",
            "php",
            "python",
            "sql",
            "query",
            "yaml",

            -- Doc
            "luadoc",
            "vimdoc",
            "phpdoc",
            "markdown",
            "markdown_inline",
        },
        highlight = {
            enable = true,
        },
        indent = {
            enable = true,
        },
        -- TODO
        -- textobjects = {},
        -- incremental_selection = {},
    },
}
