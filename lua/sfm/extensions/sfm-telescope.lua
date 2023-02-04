local event = require("sfm.event")

local config = require("sfm.extensions.sfm-telescope.config")

local M = {}

function M.setup(sfm_explorer, opts)
	config.setup(opts)

	sfm_explorer:subscribe(event.ExplorerOpened, function(payload)
		local bufnr = payload["bufnr"]
		local options = { noremap = true, silent = true, nowait = true, buffer = bufnr }

		local keys = type(config.opts.mappings.search) == "table" and config.opts.mappings.search
			or { config.opts.mappings.search }

		for _, key in pairs(keys) do
			vim.keymap.set("n", key, function()
				require("telescope").extensions["sfm-telescope"].sfm({})
			end, options)
		end
	end)
end

return M
