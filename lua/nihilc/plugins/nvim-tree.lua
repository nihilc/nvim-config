return {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = true,
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    keys = {
        {"<leader>te", "<cmd>NvimTreeToggle<cr>", desc = "(T)oggle (E)xplorer"}
    },
    opts = {
        view = {
            side = "right",
            width = {
                min = 30,
                max = 30,
                padding = 0,
            }
        },
        renderer = {
            add_trailing = true,
            group_empty = false,
            root_folder_label = function(path) 
                return "Workspace: " .. vim.fn.fnamemodify(path, ":t")
            end,
            special_files = {
                "Makefile", "README.md", "readme.md", "composer.json", "package.json"
            },
            highlight_modified = "all",
            indent_markers = {
                enable = true,
            },
            icons = {
                glyphs = {
                    git = {
                        staged      = "", -- nf-fa-plus \uf067
                        unstaged    = "", -- nf-fa-remove \uf00d
                        untracked   = "", -- nf-fa-question \uf128
                        ignored     = "◌",
                        unmerged    = "", -- nf-oct-git_merge \uf419
                        renamed     = "", -- nf-fa-arrow_right \uf061
                        deleted     = "", -- nf-fa-minus \uf056
                    }
                },
            },
        },
        git = {
            enable = true,
            show_on_open_dirs = false,
        },
        modified = {
            enable = true,
            show_on_open_dirs = false,
        },

    },
}
