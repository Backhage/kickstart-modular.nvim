return {
  {
    'nvimtools/none-ls.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    config = function()
      local null_ls = require 'null-ls' -- Still called null-ls for legacy reasons
      local augroup = vim.api.nvim_create_augroup('LspFormatting', {})

      null_ls.setup {
        sources = {
          null_ls.builtins.formatting.black,
        },

        on_attach = function(client, bufnr)
          if client.supports_method 'textDocument/formatting' then
            vim.api.nvim_clear_autocmds { group = augroup, buffer = bufnr }
            vim.api.nvim_create_autocmd('BufWritePre', {
              group = augroup,
              buffer = bufnr,
              callback = function()
                vim.lsp.buf.format { async = false }
              end,
            })
          end
        end,
      }
    end,
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = {},
  },
}
