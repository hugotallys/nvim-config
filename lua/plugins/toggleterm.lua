return {
  'akinsho/toggleterm.nvim',
  version = "*",
  config = function()
    require("toggleterm").setup({
      -- 1. Your requested mapping
      open_mapping = [[<c-\>]],

      -- 2. Your requested mode
      direction = 'float',

      -- 3. Nice "Cool" configs
      start_in_insert = true, -- Immediately type when opening
      float_opts = {
        border = 'curved',    -- Adds a nice rounded border
        winblend = 3,         -- Slight transparency (cool effect)
      },
    })

    -- EXTRA: Improved Terminal Navigation
    -- This allows you to use Ctrl+h/j/k/l to navigate out of the terminal window
    -- without having to press Ctrl+\ first.
    function _G.set_terminal_keymaps()
      local opts = {buffer = 0}
      vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
      vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
      vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
      vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
    end

    -- Apply the navigation mappings only when a terminal is open
    vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')
  end
}
