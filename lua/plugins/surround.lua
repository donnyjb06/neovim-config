return {
  {
    "echasnovski/mini.surround",

    version = false,

    event = "VeryLazy",

    config = function()
      require("mini.surround").setup({
        mappings = {
          add = "sa",
          delete = "sd",
          replace = "sr",

          find = "sf",
          find_left = "sF",

          highlight = "sh",

          update_n_lines = "sn",

          suffix_last = "l",
          suffix_next = "n",
        },

        search_method = "cover_or_next",
      })
    end,
  },
}
