return {
  {
    "ThePrimeagen/harpoon",
    name = "harpoon",
    branch = "harpoon2",

    dependencies = {
      "nvim-lua/plenary.nvim",
    },

    config = function()
      local harpoon = require("harpoon")

      harpoon:setup({
        settings = {
          save_on_toggle = true,
          sync_on_ui_close = true,
        },
      })

      vim.keymap.set("n", "<leader>a", function()
        harpoon:list():add()
      end, { desc = "[A]dd file to Harpoon" })

      vim.keymap.set("n", "<leader>e", function()
        harpoon.ui:toggle_quick_menu(harpoon:list())
      end, { desc = "[E]dit Harpoon" })

      vim.keymap.set("n", "<leader>sh", function()
        harpoon.ui:toggle_quick_menu(harpoon:list())
      end, { desc = "[S]earch [H]arpoon Editors" })

      vim.keymap.set("n", "<C-h>", function()
        harpoon:list():select(1)
      end, { desc = "Harpoon editor 1" })

      vim.keymap.set("n", "<C-j>", function()
        harpoon:list():select(2)
      end, { desc = "Harpoon editor 2" })

      vim.keymap.set("n", "<C-k>", function()
        harpoon:list():select(3)
      end, { desc = "Harpoon editor 3" })

      vim.keymap.set("n", "<C-l>", function()
        harpoon:list():select(4)
      end, { desc = "Harpoon editor 4" })
    end,
  },
}
