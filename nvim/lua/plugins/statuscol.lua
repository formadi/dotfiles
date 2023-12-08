return {
	"luukvbaal/statuscol.nvim",
	config = function()
		local builtin = require("statuscol.builtin")
		local cfg = {
			foldfunc    = "builtin",
			setopt      = true, -- Whether to set the 'statuscolumn' option, may be set to false for those who
			thousands   = true, -- or line number thousands separator string ("." / ",")
			relculright = false, -- whether to right-align the cursor line number with 'relativenumber' set
			ft_ignore   = nil, -- lua table with 'filetype' values for which 'statuscolumn' will be unset
			bt_ignore   = nil, -- lua table with 'buftype' values for which 'statuscolumn' will be unset
			segments = {
				-- { text = { "%C" }, click = "v:lua.ScFa" },
				{ text = { "%s" }, click = "v:lua.ScSa" },
				{
					text      = { builtin.lnumfunc, " " }, -- line number와 editor사이의 간격 조정;
					condition = { true, builtin.not_empty },
					click     = "v:lua.ScLa",
				},
				{
					text      = { " ", builtin.foldfunc, " " },
					condition = { builtin.not_empty, true, builtin.not_empty },
					click     = "v:lua.ScFa",
				},
			},
			clickmod = "c", -- modifier used for certain actions in the builtin clickhandlers:
			clickhandlers = { -- builtin click handlers
				Lnum                    = builtin.lnum_click,
				FoldClose               = builtin.foldclose_click,
				FoldOpen                = builtin.foldopen_click,
				FoldOther               = builtin.foldother_click,
				DapBreakpointRejected   = builtin.toggle_breakpoint,
				DapBreakpoint           = builtin.toggle_breakpoint,
				DapBreakpointCondition  = builtin.toggle_breakpoint,
				DiagnosticSignError     = builtin.diagnostic_click,
				DiagnosticSignHint      = builtin.diagnostic_click,
				DiagnosticSignInfo      = builtin.diagnostic_click,
				DiagnosticSignWarn      = builtin.diagnostic_click,
				GitSignsTopdelete       = builtin.gitsigns_click,
				GitSignsUntracked       = builtin.gitsigns_click,
				GitSignsAdd             = builtin.gitsigns_click,
				GitSignsChange          = builtin.gitsigns_click,
				GitSignsChangedelete    = builtin.gitsigns_click,
				GitSignsDelete          = builtin.gitsigns_click,
				gitsigns_extmark_signs_ = builtin.gitsigns_click,
			},
		}
		require("statuscol").setup(cfg)
	end,
}
