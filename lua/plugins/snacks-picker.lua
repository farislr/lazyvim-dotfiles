return {
  "folke/snacks.nvim",
  ---@type snacks.Config
  opts = {
    picker = {
      win = {
        input = {
          keys = {
            ["<Tab>"] = { "focus_list", mode = { "i", "n" } },
            ["<S-Tab>"] = { "focus_preview", mode = { "i", "n" } },
          },
        },
        list = {
          keys = {
            ["<Tab>"] = { "focus_preview", mode = { "n", "i" } },
            ["<S-Tab>"] = { "focus_input", mode = { "n", "i" } },
          },
        },
        preview = {
          keys = {
            ["<Tab>"] = { "focus_input", mode = { "n", "i" } },
            ["<S-Tab>"] = { "focus_list", mode = { "n", "i" } },
          },
        },
      },
    },
  },
}
