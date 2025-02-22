-- return {
--   "hitdp/cmp-flypy.nvim",
--   build = "make",
--   dependencies = { "nvim-cmp" },
--   event = "verylazy",
--   config = function()
--     require("flypy").setup({
--       dict_name = "flypy",
--       comment = true,
--       filetype = { "markdown" },
--       num_filter = true,
--       space_select_enable = false,
--     })
--
--     vim.schedule(function()
--       local cmp = require("cmp")
--       cmp.setup.filetype({ "*" }, {
--         sources = cmp.config.sources({
--           { name = "flypy" },
--           { name = "nvim_lsp" },
--           { name = "buffer" },
--           { name = "path" },
--         }),
--       })
--     end)
--   end,
-- }

return {
  {
    "hitdp/cmp-flypy.nvim",
    branch = "temp",
    build = "make",
    dependencies = { "nvim-cmp" },
    config = function()
      require("flypy").setup({
        dict_name = "flypy",
        comment = true,
        filetype = { "markdown" },
        num_filter = true,
        source_code = false,
        space_select_enable = false,
        space_select_enable_hint = "",
        space_select_switch_mappings = "<C-Space>",
      })
    end,
  },
  {
    "nvim-cmp",
    opts = function(_, opts)
      table.insert(opts.sources, 1, {
        name = "flypy",
      })
      return opts
    end,
  },
}
