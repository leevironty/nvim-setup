return {
    "NvChad/base46",
    dependencies = { 'nvim-lua/plenary.nvim' },
    build = function()
      require("base46").load_all_highlights()
    end,
  }
