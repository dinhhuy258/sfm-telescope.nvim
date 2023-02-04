local event = require("sfm.event")

local M = {}

function M.setup(sfm_explorer, opts)
	sfm_explorer:subscribe(event.ExplorerOpened, function(payload)
		local bufnr = payload["bufnr"]
		local options = { noremap = true, silent = true, nowait = true, buffer = bufnr }

		vim.keymap.set("n", "/", function()
			require("telescope").extensions["sfm-telescope"].sfm({})
		end, options)
	end)
end

return M
