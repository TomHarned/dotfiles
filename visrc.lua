-- load standard vis module, providing parts of the Lua API
require('vis')
require('plugins/v-slime')
require('plugins/vis-fzf-open')


local plug = require('plugins/vis-plug').init(conf, true)

local plugins = {
	{ url = 'erf/vis-sneak' },
	{ url = 'erf/vis-highlight', alias = 'hi' },
	{ url = 'erf/vis-cursors' },
	{ url = 'lutobler/vis-modelines' },
	
}
plug.init(plugins)

-- Your global configuration options
-- https://repo.or.cz/vis-goto-file.git
vis.events.subscribe(vis.events.INIT, function()

-- Remap C-w to Space-w
vis:map(vis.modes.NORMAL, "<Space>w", "<C-w>")
vis:map(vis.modes.NORMAL, "<Space>ff", ":fzf<Enter>")
vis:map(vis.modes.VISUAL, "gq", ":|fmt -w 80<Enter>")
vis:command('set theme acme')
--vis:command('set theme base16-grayscale-dark')
vis:command('set change-256colors on')
end)

vis.events.subscribe(vis.events.WIN_OPEN, function(win)
-- Your per window configuration options e.g.
vis:command('set number')
vis:command('set tabwidth 4')
vis:command('set expandtab on')
vis:command('set autoindent on')
vis:command('set colorcolumn 80')



end)

