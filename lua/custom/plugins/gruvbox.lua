return {
  {
    'ellisonleao/gruvbox.nvim',
    priority = 1000,
    config = true,
    init = function()
      vim.o.background = 'dark'
      vim.cmd.colorscheme 'gruvbox'
      vim.cmd.hi 'Comment gui=none'
    end,
  },
}
-- vim: ts=2 sts=2 sw=2 et
