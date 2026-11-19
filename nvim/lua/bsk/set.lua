local opt = vim.opt

-- line numbers and relative numbers
opt.number = true
opt.relativenumber = false

-- spacing
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true

-- keep only dumb indent
opt.smartindent = false
vim.cmd('filetype indent off')

-- do not wrap (go to new line)
opt.wrap = false

-- no mouse
opt.mouse = ""

-- use system clipboard for all yank/delete/paste
opt.clipboard = "unnamedplus"

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

-- load cfilter plugin at startup
vim.cmd('packadd cfilter')

-- disable the python3 provider: its detection runs on every python buffer
-- (via ftplugin/python.vim) and costs ~2s; no plugin here needs it
vim.g.loaded_python3_provider = 0

-- prevent Vim modeline misfire
vim.opt.modeline = false
