local opt = vim.opt

-- show both line numbers and relative numbers
opt.number = true
opt.relativenumber = true

-- spacing
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.smartindent = true

-- do not wrap (go to new line)
opt.wrap = false

opt.swapfile = false
opt.backup = false
opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
opt.undofile = true

-- search
opt.hlsearch = false
opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true

opt.termguicolors = true

opt.scrolloff = 8
opt.signcolumn = "yes"

opt.updatetime = 50
