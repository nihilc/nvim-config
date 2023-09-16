local o = vim.opt
local g = vim.g

---- Globals

g.mapleader = " "
g.maplocalleader = " "

g.python3_host_prog = "~/.local/share/python3/bin/python"

-- Disable providers
g.loaded_node_provider = 0
g.loaded_ruby_provider = 0
g.loaded_perl_provider = 0

---- Options

-- UI
o.laststatus = 3 -- always show status line and only one
o.ruler = true -- show line and column number of cursor
o.cursorline = true -- highlights cursor line
o.showmode = true -- show mode
o.signcolumn = "yes" -- always show sign column
o.termguicolors = true -- true color support

-- Visual
o.number = true -- line number
o.numberwidth = 2 -- line number width
o.relativenumber = true -- line relative number
o.scrolloff = 4 -- lines of context
o.sidescrolloff = 8 -- lines of context
o.wrap = false -- line wrap
o.splitright = true -- new windows below current
o.splitbelow = true -- new windows right of current
o.pumheight = 10 -- pop-up height
o.pumblend = 10 -- pop-up transparency 0-100

-- Indentation
o.smartindent = true -- smart indent on new line
o.expandtab = true -- use spaces
o.shiftround = true -- round indent
o.shiftwidth = 2 -- indent size
o.tabstop = 2 -- indent size
o.softtabstop = 2 -- indent size

-- Search
o.ignorecase = true -- ignore case in search
o.smartcase = true -- Override ignore case if search has upper case

-- Files
o.undofile = true -- Save undo file
o.undolevels = 10000 -- number of changes to undo

-- Clipboard
o.clipboard = "unnamedplus"

-- Spell
o.spell = true -- enable spell
o.spelloptions = "camel" -- fix camelCase spell
o.spelllang = { "en_us", "es" }
