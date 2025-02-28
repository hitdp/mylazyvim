return {
  -- 安装 cmp-im 插件
  {
    "yehuohan/cmp-im",
    dependencies = {
      "hrsh7th/nvim-cmp", -- 依赖 nvim-cmp 插件
      "hitdp/cmp-im-flypy", -- 依赖 cmp-im-flypy 插件
    },
    config = function()
      -- 在此处进行 cmp-im 的配置
      require("cmp_im").setup({
        -- 启用输入法
        enable = false,
        -- 设置输入法表
        tables = require("cmp_im_flypy").tables({ "flypy" }),
      })
      vim.keymap.set({ "n", "v", "c", "i" }, "<M-;>", function()
        vim.notify(string.format("IM is %s", require("cmp_im").toggle() and "enabled" or "disabled"))
      end)

      -- 设置 nvim-cmp 的补全源
      require("cmp").setup({
        sources = {
          { name = "IM" },
          { name = "nvim_lsp" },
          { name = "buffer" },
          { name = "path" },
          -- 其他补全源...
        },
        -- 设置按键映射
        mapping = {
          -- 将 <Space> 键映射为选择输入法的补全项
          ["<Space>"] = require("cmp").mapping.confirm({ select = true }),
          -- 其他按键映射...
        },
      })
    end,
  },
}
