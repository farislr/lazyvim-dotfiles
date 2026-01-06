return {
  "saghen/blink.cmp",
  opts = {
    completion = { list = { selection = { preselect = false, auto_insert = true } } },
    keymap = {
      preset = "default",
      ["<Tab>"] = { "select_next" },
      ["<S-Tab>"] = { "select_prev" },
    },
  },
}
