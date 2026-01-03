return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      qmlls = {
        cmd = { "/home/linuxbrew/.linuxbrew/bin/qmlls", "-E" },
      },
      gopls = {
        settings = {
          gopls = {
            staticcheck = false,
          },
        },
      },
    },
  },
}
