function Map(keymaps)
    local default_opts = {
        silent = true,
        remap = false
    }
    for mode, mode_keymaps in pairs(keymaps) do
        for lhs, args in pairs(mode_keymaps) do
            local rhs = args[1]
            local opts = args.opts or default_opts
            opts.desc = args[2]

            vim.keymap.set(mode, lhs, rhs, opts)
        end
    end
end

local default_keymaps = {
    n = {
        -- Basic
        ["<c-s>"] = { "<cmd>w<cr>", "Save" },
        ["<esc>"] = { "<cmd>noh<cr>", "Clear highlights" },
        -- Windows
        ["<m-k>"] = { "<c-w>k", "Move to window up" },
        ["<m-j>"] = { "<c-w>j", "Move to window down" },
        ["<m-h>"] = { "<c-w>h", "Move to window left" },
        ["<m-l>"] = { "<c-w>l", "Move to window right" },
        -- Buffers
        ["<tab>"] = { "<cmd>bn<cr>", "Buffer next" },
        ["<s-tab>"] = { "<cmd>bp<cr>", "Buffer prev" },
        ["<leader>bn"] = { "<cmd>enew<cr>", "Buffer new" },
        ["<leader>bx"] = { "<cmd>bdelete<cr>", "Buffer close" },
    },
    i = {
        -- Movement in insert mode
        ["<m-k>"] = { "<up>", "Move up" },
        ["<m-j>"] = { "<down>", "Move down" },
        ["<m-h>"] = { "<left>", "Move left" },
        ["<m-l>"] = { "<right>", "Move right" },
    },
    v = {
        ["<leader>p"] = { "\"0p", "Paste last yank" },
    },
    t = {},
    c = {
        -- Movement in command mode
        ["<m-k>"] = { "<up>", "Prev command", opts = { silent = false } },
        ["<m-j>"] = { "<down>", "Next command", opts = { silent = false } },
        ["<m-h>"] = { "<left>", "Move left", opts = { silent = false } },
        ["<m-l>"] = { "<right>", "Move right", opts = { silent = false } },
    },
}

Map(default_keymaps)
