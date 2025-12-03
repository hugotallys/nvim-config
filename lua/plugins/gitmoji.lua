return {
	"olacin/telescope-gitmoji.nvim",
	config = function()
		local telescope = require("telescope")

    telescope.load_extension("gitmoji")

    vim.keymap.set("n", "<Leader>gm", telescope.extensions.gitmoji.gitmoji, {})
	end,
	dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
}
