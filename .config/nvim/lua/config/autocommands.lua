vim.api.nvim_create_autocmd('FileType', {
  pattern = { '<filetype>' },
  callback = function()
      vim.treesitter.start()
      vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
      vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"

  end,
})
