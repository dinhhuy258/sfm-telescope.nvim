local has_telescope, telescope = pcall(require, "telescope")
if not has_telescope then
	return
end

local api = require("sfm.api")

local finders = require("telescope.finders")
local entry_display = require("telescope.pickers.entry_display")
local telescope_config = require("telescope.config").values
local pickers = require("telescope.pickers")
local actions = require("telescope.actions")
local state = require("telescope.actions.state")

return telescope.register_extension({
	exports = {
		sfm = function(opts)
			opts = opts or {}
			local entries = api.entry.all()

			local displayer = entry_display.create({
				separator = " ",
				items = {
					{
						width = 30,
					},
					{
						remaining = true,
					},
				},
			})

			local function make_display(entry)
				return displayer({ entry.name, { entry.value, "Comment" } })
			end

			local finder = finders.new_table({
				results = entries,
				entry_maker = function(entry)
					return {
						display = make_display,
						name = entry.name,
						value = entry.path,
						ordinal = entry.name,
					}
				end,
			})

			pickers
				.new(opts, {
					prompt_title = "sfm",
					finder = finder,
					previewer = false,
					sorter = telescope_config.generic_sorter(opts),
					attach_mappings = function(prompt_bufnr)
						actions.select_default:replace(function()
							local selected_entry = state.get_selected_entry(prompt_bufnr)
							if selected_entry == nil then
								actions.close(prompt_bufnr)
								return
							end

							api.navigation.focus(selected_entry.value)

							actions.close(prompt_bufnr)
						end)
						return true
					end,
				})
				:find()
		end,
	},
})
