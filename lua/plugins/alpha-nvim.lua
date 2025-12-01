return {
	"goolord/alpha-nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local alpha = require("alpha")
		local dashboard = require("alpha.themes.dashboard")

		-- 1. The ASCII Header
		dashboard.section.header.val = {
			[[                                                    ]],
			[[ ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ]],
			[[ ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ]],
			[[ ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ]],
			[[ ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ]],
			[[ ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ]],
			[[ ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ]],
			[[                                                    ]],
		}

		-- 2. Buttons with helper function to generate icons safely
		local function icon(code)
			return vim.fn.nr2char(code)
		end

		dashboard.section.buttons.val = {
			dashboard.button("f", icon(0xf002) .. "  Find File", ":Telescope find_files<CR>"), -- Search Icon
			dashboard.button("g", icon(0xf0c9) .. "  Live Grep", ":Telescope live_grep<CR>"), -- Menu/List Icon
			dashboard.button("n", icon(0xf15b) .. "  New File", ":ene <BAR> startinsert <CR>"), -- File Icon
			dashboard.button("c", icon(0xf013) .. "  Configuration", ":e $MYVIMRC <CR>"), -- Gear Icon
			dashboard.button("q", icon(0xf011) .. "  Quit", ":qa<CR>"), -- Power Icon
		}

		-- 3. Footer (Optional: Shows startup time)
		-- This calculates how many plugins you have
		vim.api.nvim_create_autocmd("User", {
			pattern = "LazyVimStarted",
			callback = function()
				local stats = require("lazy").stats()
				local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
				dashboard.section.footer.val = icon(0xf0e7)
					.. "  Neovim loaded "
					.. stats.loaded
					.. "/"
					.. stats.count
					.. " plugins in "
					.. ms
					.. "ms"
				pcall(vim.cmd.AlphaRedraw)
			end,
		})

		alpha.setup(dashboard.config)
	end,
}
