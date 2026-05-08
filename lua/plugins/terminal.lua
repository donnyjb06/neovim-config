return {
  {
    "akinsho/toggleterm.nvim",
    version = "*",

    config = function()
      require("toggleterm").setup({
        size = 15,

        direction = "horizontal",

        start_in_insert = true,
        insert_mappings = true,
        terminal_mappings = true,

        persist_size = true,
        persist_mode = true,

        close_on_exit = false,
        shade_terminals = true,

        shell = vim.o.shell,
      })

      local Terminal = require("toggleterm.terminal").Terminal

      local terminals = {
        [1] = Terminal:new({
          direction = "horizontal",
          hidden = true,
          count = 1,
        }),

        [2] = Terminal:new({
          direction = "horizontal",
          hidden = true,
          count = 2,
        }),

        [3] = Terminal:new({
          direction = "horizontal",
          hidden = true,
          count = 3,
        }),

        [4] = Terminal:new({
          direction = "horizontal",
          hidden = true,
          count = 4,
        }),
      }

      local current_terminal = nil

      local function hide_all_terminals()
        for _, terminal in pairs(terminals) do
          if terminal:is_open() then
            terminal:close()
          end
        end
      end

      local function open_terminal(number)
        if current_terminal == number and terminals[number]:is_open() then
          terminals[number]:close()
          current_terminal = nil
          return
        end

        hide_all_terminals()

        terminals[number]:open()

        current_terminal = number
      end

      -- Main toggle
      vim.keymap.set("n", "<leader>t", function()
        if current_terminal and terminals[current_terminal]:is_open() then
          terminals[current_terminal]:close()
          current_terminal = nil
        else
          open_terminal(1)
        end
      end, { desc = "[T]oggle Terminal Panel" })

      -- Terminal switching
      vim.keymap.set("n", "<leader>1", function()
        open_terminal(1)
      end, { desc = "Terminal 1" })

      vim.keymap.set("n", "<leader>2", function()
        open_terminal(2)
      end, { desc = "Terminal 2" })

      vim.keymap.set("n", "<leader>3", function()
        open_terminal(3)
      end, { desc = "Terminal 3" })

      vim.keymap.set("n", "<leader>4", function()
        open_terminal(4)
      end, { desc = "Terminal 4" })

      -- Resize terminal
      vim.keymap.set("n", "<leader>+", function()
        vim.cmd("resize +5")
      end, { desc = "Increase Terminal Size" })

      vim.keymap.set("n", "<leader>-", function()
        vim.cmd("resize -5")
      end, { desc = "Decrease Terminal Size" })
    end,
  },
}
