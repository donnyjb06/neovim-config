return {
  {
    "echasnovski/mini.indentscope",

    version = false,

    event = {
      "BufReadPre",
      "BufNewFile",
    },

    config = function()
      require("mini.indentscope").setup({
        symbol = "│",

        options = {
          try_as_border = true,
        },

        draw = {
          delay = 50,
          animation = require("mini.indentscope").gen_animation.linear({
            easing = "out",
            duration = 80,
            unit = "total",
          }),
        },
      })

      vim.api.nvim_set_hl(0, "MiniIndentscopeSymbol", {
        fg = "#54546d",
      })
    end,
  },
}
