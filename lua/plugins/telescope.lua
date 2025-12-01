return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "v0.1.9",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local builtin = require("telescope.builtin")

			-- Find files by name 
			vim.keymap.set("n", "<C-p>", builtin.find_files, {})

			-- Find text/string inside all project files
			vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})

			-- List all diagnostics (Errors, Warnings, Hints) in the current file
			vim.keymap.set("n", "<leader>dd", function()
				builtin.diagnostics({ bufnr = 0 })
			end, { desc = "Document Diagnostics" })

			-- List all diagnostics across your ENTIRE PROJECT (Open Buffers)
			vim.keymap.set("n", "<leader>dw", function()
				builtin.diagnostics()
			end, { desc = "Workspace Diagnostics" })
		end,
	},
	{
		"nvim-telescope/telescope-ui-select.nvim",
		config = function()
			require("telescope").setup({
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
				},
			})
			require("telescope").load_extension("ui-select")
		end,
	},
}
