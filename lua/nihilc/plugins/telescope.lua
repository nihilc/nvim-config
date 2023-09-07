return {
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.2",
        dependencies = { "nvim-lua/plenary.nvim" },
        keys = {
            {"<leader>ff", function() require('telescope.builtin').find_files()  end, desc = "find file"},
            {"<leader>fw", function() require('telescope.builtin').live_grep()   end, desc = "find word"},
            {"<leader>fb", function() require('telescope.builtin').buffers()     end, desc = "find buffer"},
            {"<leader>th", function() require('telescope.builtin').help_tags()   end, desc = "show help tags"},
            {"<leader>tk", function() require('telescope.builtin').keymaps()     end, desc = "show keymaps"},
            {"<leader>tc", function() require('telescope.builtin').colorscheme() end, desc = "change colorscheme"},
        },
        -- TODO config interface
        -- opts = {}
    }
}
