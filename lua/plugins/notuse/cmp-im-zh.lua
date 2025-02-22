return {
  "yehuohan/cmp-im-zh",
  dependencies = {
    "hrsh7th/nvim-cmp", -- 确保已安装 nvim-cmp
  },
  config = function()
    local cmp = require("cmp")
    require("cmp-im-zh").setup({
      dict = { "/usr/share/ibus-table/tables/pinyin.db" }, -- 这里指定拼音词库
      first_upper = false, -- 是否首字母大写
      max_items = 10, -- 最大候选词数
    })

    -- 在 nvim-cmp 中启用 `cmp-im-zh` 源
    cmp.setup({
      sources = cmp.config.sources({
        { name = "im-zh" }, -- 启用中文输入
      }),
    })
  end,
}
