
---@type LazySpec
return {
  "nvimtools/none-ls.nvim",
  dependencies = {
    { "AstroNvim/astrolsp", opts= {}},
  },
  opts = function(_, opts)
    local null_ls = require("null-ls")
    -- Ensure opts.sources exist kjs
    opts.sources = opts.sources or {}

    -- Insert Prettier globally without replacing existing sources
    opts.sources = require("astrocore").list_insert_unique(opts.sources, {
      null_ls.builtins.formatting.prettier.with({
        command = "prettier", -- Use globally installed Prettier
        extra_args = { "--config-precedence", "prefer-file" }, -- Use project config if available
      }),
      null_ls.builtins.formatting.black.with({
        prefer_local = "venv/bin/black"
      }),

      null_ls.builtins.diagnostics.mypy.with({
        prefer_local = "venv/bin/mypy"
      }),

      -- null_ls.builtins.diagnostics.flake8.with({
      --   prefer_local = "venv/bin/flake8"
      -- })
    })
  end,
}
