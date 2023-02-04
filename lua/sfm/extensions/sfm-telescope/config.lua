local M = {
	opts = {},
}

local default_config = {
	mappings = {
		search = { "/" },
	},
}

function M.setup(opts)
	M.opts = default_config

	if opts == nil then
		return
	end

	if opts.mappings ~= nil and opts.mappings.toggle_filter ~= nil then
		M.opts.mappings.search = opts.mappings.search
	end
end

return M
