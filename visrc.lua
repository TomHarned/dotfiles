-- load standard vis module, providing parts of the Lua API
require('vis')

plugin_vis_open = require('plugins/vis-fzf-open')
plugin_vis_open.fzf_path = (
    "FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g \"\"' fzf"
)

local plug = require('plugins/vis-plug').init(conf, true)

plugin_vis_open.fzf_args = "-q '!.class ' --height=40%"
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

end)

vis.events.subscribe(vis.events.WIN_OPEN, function(win)
-- Your per window configuration options e.g.
vis:command('set number')
vis:command('set tabwidth 4')
vis:command('set expandtab on')
vis:command('set autoindent on')
-- vis:command('set theme base16-eighties')
vis:command('set theme base16-nord')


end)
