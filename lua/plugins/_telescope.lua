local M = {}

function M.config()
	local U = require "utils"
	local finders = require "telescope.builtin"
	local actions = require "telescope.actions"
	local sorters = require "telescope.sorters"
	local wk = require("which-key")

	local previewers = require('telescope.previewers')
	local putils = require('telescope.previewers.utils')
	local pfiletype = require('plenary.filetype')
	local new_maker = function(filepath, bufnr, opts)
		opts = opts or {}
		if opts.use_ft_detect == nil then
			local ft = pfiletype.detect(filepath)
			-- Here for example you can say: if ft == "xyz" then this_regex_highlighing else nothing end
			opts.use_ft_detect = false
			putils.regex_highlighter(bufnr, ft)
		end
		previewers.buffer_previewer_maker(filepath, bufnr, opts)
	end

    require("telescope").setup(
        {
            defaults = {
    			buffer_previewer_maker = new_maker, -- custom preview which will optimize telescope
                prompt_position = "top",
                prompt_prefix = " ❯ ",
                sorting_strategy = "ascending",
				file_ignore_patterns = {"node_modules", "target", "dependencies"},
                mappings = {
                    i = {
                        ["<ESC>"] = actions.close,
                        ["<C-j>"] = actions.move_selection_next,
                        ["<C-k>"] = actions.move_selection_previous,
                        ["<C-o>"] = function()
                            return
                        end,
                        ["<TAB>"] = actions.toggle_selection + actions.move_selection_next,
                        ["<C-s>"] = actions.send_selected_to_qflist,
                        ["<C-q>"] = actions.send_to_qflist
                    }
                },
                file_sorter = sorters.get_fzy_sorter,
                generic_sorter = sorters.get_fzy_sorter
            },
            extensions = {
                fzy_native = {
                    override_file_sorter = true,
                    override_generic_sorter = true
                }
            }
        }
    )

    require("telescope").load_extension("fzy_native")

    function TelescopeOpen(fn)
        U.move_cursor_from_tree()
        finders[fn]()
    end

	wk.register({
	["f"] = {
			name = "+Telescope",
			a = { ":Telescope find_files theme=get_dropdown<CR>", "  Telescope find file" },
			b = { ":lua TelescopeOpen('buffers')<CR>", " ﬘ Telescope list buffer" },
			c = { ":lua TelescopeOpen('live_grep')<CR>", "  Telescope live grep" },
			d = { "<CMD>lua TelescopeOpen('oldfiles')<CR>", "  Telescope buffer history" },
			e = { "<CMD>lua TelescopeOpen('registers')<CR>", "  Telescope register list" },
		}
	})
end

return M
