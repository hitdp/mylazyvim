return {
  -- 在您的 Neovim 配置文件中添加以下内容
  -- 其他插件...

  -- 安装 cmp-im 插件
  {
    "yehuohan/cmp-im",
    dependencies = {
      "hrsh7th/nvim-cmp", -- 依赖 nvim-cmp 插件
      "hitdp/cmp-im-flypy", -- 依赖 cmp-im-zh 插件
    },
    config = function()
      -- 在此处进行 cmp-im 的配置
      require("cmp_im").setup({
        -- 启用输入法
        enable = true,
        -- 设置输入法表
        tables = require("cmp_im_flypy").tables({ "flypy" }),
      })
      vim.keymap.set({ "n", "v", "c", "i" }, "<M-;>", function()
        vim.notify(string.format("IM is %s", require("cmp_im").toggle() and "enabled" or "disabled"))
      end)

      -- 设置 nvim-cmp 的补全源
      require("cmp").setup({
        sources = {
          { name = "IM" }, -- 添加 IM 补全源
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

  -- 其他插件...
}
