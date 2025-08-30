-- return {}
return {
  "mfussenegger/nvim-lint",
  event = "LazyFile",
  opts = {
    events = { "BufWritePost", "BufReadPost", "BufNewFile" },
    linters_by_ft = {
      go = { "golangcilint" },
    },
  },
}
