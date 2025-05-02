vim.api.nvim_create_autocmd({ 'BufRead', 'BufNewFile' }, {
  pattern = '*.html.erb',
  command = 'set filetype=eruby',
})

vim.api.nvim_create_autocmd({ 'BufRead', 'BufNewFile' }, {
  pattern = '*.rb',
  command = 'set filetype=ruby',
})

vim.api.nvim_create_autocmd('BufWritePre', {
  pattern = '*',
  callback = function(args)
    require('conform').format { bufnr = args.buf }
  end,
})

require('luasnip').filetype_extend('ruby', { 'rails' })
require('luasnip').filetype_extend 'erb'
