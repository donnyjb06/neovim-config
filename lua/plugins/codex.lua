return {
  {
    "kkrampis/codex.nvim",
    cmd = { "Codex", "CodexToggle" },

    keys = {
      {
        "<leader>Ac",
        function()
          require("codex").toggle()
        end,
        desc = "[A]I [C]odex Toggle",
        mode = { "n", "t" },
      },
    },

    opts = {},
  },
}
