return {
  "saghen/blink.cmp",
  dependencies = {
    { "giuxtaposition/blink-cmp-copilot" },
  },
  opts = {
    sources = {

      default = { "lsp", "path", "snippets", "buffer", "copilot" },
      { name = "lsp", priority = 10 },
      { name = "copilot", priority = 5 },
      providers = {
        copilot = {
          name = "copilot",
          module = "blink-cmp-copilot",
          score_offset = 100,
          async = true,
        },
      },
    },
    -- completion = { list = { selection = { preselect = false, auto_insert = true } } },
    -- keymap = {
    --   preset = "default",
    --   ["<Tab>"] = { "select_next" },
    --   ["<S-Tab>"] = { "select_prev" },
    -- },
  },
}
