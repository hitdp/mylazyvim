return {
  "ibhagwan/fzf-lua",
  config = function()
    require("fzf-lua").setup({
      keymap = {
        builtin = {
          ["<Esc>"] = "abort",
        },
      },
    })
    vim.api.nvim_set_keymap("t", "jk", "<Esc>", { noremap = true, silent = true })
  end,
}
