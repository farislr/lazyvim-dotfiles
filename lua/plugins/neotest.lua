return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-neotest/nvim-nio",
    "nvim-lua/plenary.nvim",
    "antoinemadec/FixCursorHold.nvim",
    "nvim-treesitter/nvim-treesitter",
    {
      "fredrikaverpil/neotest-golang",
      version = "^2",
      dependencies = {
        "andythigpen/nvim-coverage", -- Added dependency
      },
    },
  },
  opts = {
    adapters = {
      ["neotest-golang"] = {
        runner = "go", -- Use 'go' as the test runner
        go_test_args = {
          "-v",
          "-timeout=60s",
          "-coverprofile=" .. vim.fn.getcwd() .. "/coverage.out",
        },
      },
    },
  },
}
