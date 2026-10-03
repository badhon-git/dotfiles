-- Rubya Akter Badhon

local o = vim.opt
o.number = true
o.relativenumber = true
o.tabstop = 4
o.shiftwidth = 4
o.expandtab = true
o.smartindent = true
o.wrap = false
o.ignorecase = true
o.smartcase = true
o.termguicolors = true
o.signcolumn = "yes"
o.scrolloff = 8
o.swapfile = false
vim.g.mapleader = " "
local timer = vim.uv.new_timer()
vim.api.nvim_create_autocmd({ "TextChanged", "TextChangedI" }, {
  pattern = "*.tex",
  callback = function(ev)
    timer:stop()
    timer:start(300, 0, vim.schedule_wrap(function()
      if vim.api.nvim_buf_is_valid(ev.buf) and vim.bo[ev.buf].modified then
        vim.api.nvim_buf_call(ev.buf, function() vim.cmd("silent! write") end)
      end
    end))
  end,
})
