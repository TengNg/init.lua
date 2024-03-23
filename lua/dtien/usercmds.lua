local usercmd = vim.api.nvim_create_user_command
usercmd('Nterm', 'tabe | term', {})
usercmd('Vterm', 'vsp | vertical resize -12 | term', {})
usercmd('Hterm', 'sp | resize -6 | term', {})
usercmd('Bd', 'up | %bd | e#', {}) -- delete all hidden buffers

