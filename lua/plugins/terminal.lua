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

      local runner = Terminal:new({
        direction = "horizontal",
        hidden = true,
        count = 9,
        close_on_exit = false,
      })

      local current_terminal = nil
      local last_runner_command = nil

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

      local function shellescape(value)
        return vim.fn.shellescape(value)
      end

      local function get_current_file()
        local file = vim.fn.expand("%:p")

        if file == "" then
          vim.notify("No file to run", vim.log.levels.WARN)
          return nil
        end

        if vim.bo.modified then
          vim.cmd("write")
        end

        return file
      end

      local runners = {
        python = function(file)
          return "python3 " .. shellescape(file)
        end,

        c = function(file)
          local output = vim.fn.fnamemodify(file, ":r")

          return "gcc "
              .. shellescape(file)
              .. " -o "
              .. shellescape(output)
              .. " && "
              .. shellescape(output)
        end,

        cpp = function(file)
          local output = vim.fn.fnamemodify(file, ":r")

          return "g++ "
              .. shellescape(file)
              .. " -std=c++20 -Wall -Wextra -o "
              .. shellescape(output)
              .. " && "
              .. shellescape(output)
        end,

        java = function(file)
          local dir = vim.fn.fnamemodify(file, ":h")
          local class = vim.fn.fnamemodify(file, ":t:r")

          return "cd "
              .. shellescape(dir)
              .. " && javac "
              .. shellescape(file)
              .. " && java "
              .. shellescape(class)
        end,

        javascript = function(file)
          return "node " .. shellescape(file)
        end,

        typescript = function(file)
          return "tsx " .. shellescape(file)
        end,
      }

      local function run_command(command)
        last_runner_command = command

        if not runner:is_open() then
          runner:open()
        end

        runner:send(command, true)
      end

      local function run_current_file()
        local file = get_current_file()

        if not file then
          return
        end

        local filetype = vim.bo.filetype
        local build_command = runners[filetype]

        if not build_command then
          vim.notify(
            "No runner configured for filetype: " .. filetype,
            vim.log.levels.WARN
          )
          return
        end

        run_command(build_command(file))
      end

      local function run_last_command()
        if not last_runner_command then
          vim.notify("No previous run command", vim.log.levels.WARN)
          return
        end

        run_command(last_runner_command)
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

      -- Code runner
      vim.keymap.set("n", "<leader>rr", run_current_file, {
        desc = "[R]un Current File",
      })

      vim.keymap.set("n", "<leader>rl", run_last_command, {
        desc = "[R]un Last Command",
      })

      vim.keymap.set("n", "<leader>rt", function()
        runner:toggle()
      end, {
        desc = "[R]un Toggle Terminal",
      })
    end,
  },
}
