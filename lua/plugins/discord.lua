return {
  "vyfor/cord.nvim",
  build = ":Cord update",
  opts = {
    timestamp = {
      enabled = true,
      reset_on_idle = true,
      reset_on_change = false,
      shared = false,
    },
    text = {
      default = nil,
      -- workspace = function(opts)
      --   return "In " .. opts.workspace
      -- end,
      workspace = "",
      -- viewing = function(opts)
      --   return "Viewing " .. opts.filename
      -- end,
      -- editing = function(opts)
      --   return "Editing " .. opts.filename
      -- end,
      viewing = "",
      editing = "",
      -- file_browser = function(opts)
      --   return "Browsing files in " .. opts.name
      -- end,
      file_browser = "",
      -- plugin_manager = function(opts)
      --   return "Managing plugins in " .. opts.name
      -- end,
      -- lsp = function(opts)
      --   return "Configuring LSP in " .. opts.name
      -- end,
      plugin_manager = "",
      lsp = "",
      -- docs = function(opts)
      --   return "Reading " .. opts.name
      -- end,
      docs = "",
      -- vcs = function(opts)
      --   return "Committing changes in " .. opts.name
      -- end,
      vcs = "",
      -- notes = function(opts)
      --   return "Taking notes in " .. opts.name
      -- end,
      -- debug = function(opts)
      --   return "Debugging in " .. opts.name
      -- end,
      -- test = function(opts)
      --   return "Testing in " .. opts.name
      -- end,
      -- diagnostics = function(opts)
      --   return "Fixing problems in " .. opts.name
      -- end,
      -- games = function(opts)
      --   return "Playing " .. opts.name
      -- end,
      -- terminal = function(opts)
      --   return "Running commands in " .. opts.name
      -- end,
      notes = "",
      debug = "",
      test = "",
      diagnostics = "",
      games = "",
      terminal = "",
      dashboard = "",
    },
  },
}
