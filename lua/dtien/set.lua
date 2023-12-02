local o = vim.opt
local g = vim.g

-- need to put this at top
g.mapleader = " "

-- o.statusline = "[%{v:lua.vim.api.nvim_get_mode().mode}] %f %m %= %y %5l:%-4c [%L/%P]"
-- o.showtabline = 3
-- o.laststatus = 3
-- o.cursorline = true
-- o.cmdheight = 0
-- o.winbar = "%= %m %f %="

o.showmode = false
o.nu = true
o.rnu = true

o.tabstop = 4
o.softtabstop = 4
o.shiftwidth = 4
o.expandtab = true

o.smartindent = true

o.splitright = true
o.splitbelow = true

o.wrap = false
o.hlsearch = false
o.incsearch = true

o.swapfile = false
o.backup = false

o.termguicolors = true

o.scrolloff = 8
o.signcolumn = "yes"
o.colorcolumn = "120"
o.updatetime = 100

-- o.fillchars:append({
--     horiz = '━',
--     horizup = '┻',
--     horizdown = '┳',
--     vert = '┃',
--     vertleft = '┨',
--     vertright = '┣',
--     verthoriz = '╋',
-- })
-- o.list = true
-- o.listchars = 'eol:↵'
-- o.listchars = 'eol:¬,trail:·,nbsp:◇,tab:→ ,extends:▸,precedes:◂'
