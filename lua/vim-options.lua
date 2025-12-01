vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")

local function icon(code)
  return vim.fn.nr2char(code)
end

vim.diagnostic.config({
  virtual_text = {
    source = "always",
    prefix = function(diagnostic)
      if diagnostic.severity == vim.diagnostic.severity.ERROR then
        return icon(0xf188) .. " " -- Bug Icon
      elseif diagnostic.severity == vim.diagnostic.severity.WARN then
        return icon(0xf071) .. " " -- Triangle Icon
      elseif diagnostic.severity == vim.diagnostic.severity.HINT then
        return icon(0xf0eb) .. " " -- Lightbulb Icon
      else
        return icon(0xf05a) .. " " -- Info Icon
      end
    end,
  },
  float = {
    source = "always",
    border = "curved",
  },
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
})
