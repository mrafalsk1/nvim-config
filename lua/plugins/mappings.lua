
return {
  {
    "nvimtools/none-ls.nvim",
    keys = {
      { "<C-F>", function() vim.lsp.buf.format({ async = true }) end, desc = "Format with Prettier" },
    },
  }
}
