	require("todo-comments").setup {
		signs = true, -- show icons in the signs column
		keywords = {
			FIX = {
				icon = " ", -- icon used for the sign, and in search results
				color = "error", -- can be a hex color, or a named color (see below)
				alt = { "FIXME", "BUG", "FIXIT", "FIX", "ISSUE" }, -- a set of other keywords that all map to this FIX keywords
			},
			TODO = { icon = " ", color = "info" },
			HACK = { icon = " ", color = "warning" },
			WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
			PERF = { icon = " ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
			NOTE = { icon = " ", color = "hint", alt = { "INFO" } },
		},
		highlight = {
			before = "", -- "fg" or "bg" or empty
			keyword = "wide", -- "fg", "bg", "wide" or empty. (wide is the same as bg, but will also highlight surrounding characters)
			after = "fg", -- "fg" or "bg" or empty
		},
		colors = {
			error = { "LspDiagnosticsDefaultError", "ErrorMsg", "#DC2626" },
			warning = { "LspDiagnosticsDefaultWarning", "WarningMsg", "#FBBF24" },
			info = { "LspDiagnosticsDefaultInformation", "#2563EB" },
			hint = { "LspDiagnosticsDefaultHint", "#10B981" },
			default = { "Identifier", "#7C3AED" },
		},
	}
