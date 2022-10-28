local utils = require "user.utils"
return {
  ["<leader>"] = {
    ["N"] = { "<cmd>tabnew<cr>", "New Buffer" },
    ["H"] = { "<cmd>set hlsearch!<cr>", "Toggle Highlight" },
    ["z"] = { "<cmd>ZenMode<cr>", "Zen Mode" },

    a = {
      name = "Annotate",
      ["<cr>"] = {
        function()
          require("neogen").generate()
        end,
        "Current",
      },
      c = {
        function()
          require("neogen").generate { type = "class" }
        end,
        "Class",
      },
      f = {
        function()
          require("neogen").generate { type = "func" }
        end,
        "Function",
      },
      t = {
        function()
          require("neogen").generate { type = "type" }
        end,
        "Type",
      },
      F = {
        function()
          require("neogen").generate { type = "file" }
        end,
        "File",
      },
    },

    d = {
      name = "Document",
      n = { "<cmd>enew<cr>", "New File" },
      s = { "<cmd>setlocal spell!<cr>", "Toggle Spelling" },
      t = { "<cmd>TableModeToggle<cr>", "Toggle Table Mode" },
      p = { "<cmd>setlocal paste!<cr>", "Toggle Paste" },
      c = {
        function()
          utils.vim_opt_toggle("conceallevel", 2, 0, "Conceal")
        end,
        "Toggle Conceal",
      },
      w = {
        function()
          utils.vim_opt_toggle("wrap", true, false, "Soft Wrap")
        end,
        "Toggle Soft Wrapping",
      },
      W = {
        function()
          utils.vim_opt_toggle("textwidth", 80, 0, "Hard Wrap")
        end,
        "Toggle Hard Wrapping",
      },
      m = { ":MarkdownPreviewToggle<CR>", "Toggle Preview Markdown" },
    },

    f = {
      name = "Telescope",
      ["?"] = { "<cmd>Telescope help_tags<cr>", "Find Help" },
      ["'"] = { "<cmd>Telescope marks<cr>", "Marks" },
      F = { "<cmd>Telescope find_files hidden=true no_ignore=true<cr>", "All Files" },
      p = { "<cmd>Telescope project<cr>", "Projects" },
    },

    n = {
      name = "Notes",
      r = {
        function()
          require("zk.commands").get "ZkIndex" {}
        end,
        "Refresh Index",
      },
      l = {
        function()
          require("zk.commands").get "ZkLinks" {}
        end,
        "Link Picker",
      },
      s = {
        function()
          require("zk.commands").get "ZkNotes" { sort = { "modified" } }
        end,
        "Search",
      },
      p = {
        function()
          require("zk.commands").get "ZkNew" { dir = "personal", title = vim.fn.input "Title: " }
        end,
        "New Personal Note",
      },
      w = {
        function()
          require("zk.commands").get "ZkNew" { dir = "work", title = vim.fn.input "Title: " }
        end,
        "New Work Note",
      },
      n = {
        function()
          require("zk.commands").get "ZkNew" { dir = "daily" }
        end,
        "New Daily Note",
      },
      t = {
        function()
          require("zk.commands").get "ZkTags"()
        end,
        "Tags",
      },
    },

    s = {
      name = "Surf",
      s = {
        function()
          require("syntax-tree-surfer").select()
        end,
        "Surf",
      },
      S = {
        function()
          require("syntax-tree-surfer").select_current_node()
        end,
        "Surf Node",
      },
    },

    x = {
      name = "Debugger",
      b = {
        function()
          require("dap").toggle_breakpoint()
        end,
        "Toggle Breakpoint",
      },
      B = {
        function()
          require("dap").clear_breakpoints()
        end,
        "Clear Breakpoints",
      },
      c = {
        function()
          require("dap").continue()
        end,
        "Continue",
      },
      i = {
        function()
          require("dap").step_into()
        end,
        "Step Into",
      },
      l = {
        function()
          require("dapui").float_element "breakpoints"
        end,
        "List Breakpoints",
      },
      o = {
        function()
          require("dap").step_over()
        end,
        "Step Over",
      },
      q = {
        function()
          require("dap").close()
        end,
        "Close Session",
      },
      Q = {
        function()
          require("dap").terminate()
        end,
        "Terminate",
      },
      r = {
        function()
          require("dap").repl.toggle()
        end,
        "REPL",
      },
      s = {
        function()
          require("dapui").float_element "scopes"
        end,
        "Scopes",
      },
      t = {
        function()
          require("dapui").float_element "stacks"
        end,
        "Threads",
      },
      u = {
        function()
          require("dapui").toggle()
        end,
        "Toggle Debugger UI",
      },
      w = {
        function()
          require("dapui").float_element "watches"
        end,
        "Watches",
      },
      x = {
        function()
          require("dap.ui.widgets").hover()
        end,
        "Inspect",
      },
    },
  },
}
