return {
  {
    "tris203/precognition.nvim",
    event = "VeryLazy",

    opts = {
      startVisible = true,
      showBlankVirtLine = false,
      highlightColor = { link = "Comment" },
    },

    keys = {
      {
        "<leader>up",
        function()
          require("precognition").toggle()
        end,
        desc = "Toggle Precognition",
      },
    },
  },
}
