return function()
	require("indent_blankline").setup({
		-- char = "│",
		-- show_first_indent_level = true,
		filetype_exclude = {
			"", -- for all buffers without a file type
			"NvimTree",
			"TelescopePrompt",
			"dashboard",
			"dotooagenda",
			"flutterToolsOutline",
			"fugitive",
			"git",
			"gitcommit",
			"help",
			"json",
			"log",
			"markdown",
			"peekaboo",
			"startify",
			"todoist",
			"txt",
			"vimwiki",
			"vista",
		},
		buftype_exclude = { "terminal", "nofile" },
		-- show_trailing_blankline_indent = false,
		-- show_current_context = true,
		-- context_patterns = {
		-- 	"^if",
		-- 	"^table",
		-- 	"block",
		-- 	"class",
		-- 	"for",
		-- 	"function",
		-- 	"if_statement",
		-- 	"import",
		-- 	"list_literal",
		-- 	"method",
		-- 	"selector",
		-- 	"type",
		-- 	"var",
		-- 	"while",
		-- },
		-- space_char_blankline = " ",
	})
end
