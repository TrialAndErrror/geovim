return {
  -- Disable default plugins
  ["declancm/cinnamon.nvim"] = { disable = true },
  ["max397574/better-escape.nvim"] = { disable = true },
  ["lukas-reineke/indent-blankline.nvim"] = { disable = true },
  ["numToStr/Comment.nvim"] = { disable = true },

  -- Colorscheme/theme
  ["EdenEast/nightfox.nvim"] = {
    config = function()
      require("nightfox").setup(require "user.plugins.nightfox")
    end,
  },

  -- Font for icons
  ["yamatsum/nvim-nonicons"] = {
    requires = { "kyazdani42/nvim-web-devicons" },
  },

  -- Annotation generator
  ["danymat/neogen"] = {
    module = "neogen",
    cmd = "Neogen",
    config = function()
      require("neogen").setup(require "user.plugins.neogen")
    end,
    requires = "nvim-treesitter/nvim-treesitter",
  },

  -- Highlight, navigate, and operate on sets of matching text
  ["andymass/vim-matchup"] = {
    after = "nvim-treesitter",
  },

  -- Collection of minimal, independent, and fast Lua modules
  ["echasnovski/mini.nvim"] = {
    event = "VimEnter",
    config = function()
      require "user.plugins.mini"()
    end,
  },

  -- Markdown preview
  ["iamcco/markdown-preview.nvim"] = {
    run = function()
      vim.fn["mkdp#util#install"](0)
    end,
    ft = {
      "markdown",
    },
  },

  -- Reopen files at last edit position
  ["ethanholz/nvim-lastplace"] = {
    event = "BufRead",
    config = function()
      require("nvim-lastplace").setup(require "user.plugins.nvim-lastplace")
    end,
  },

  -- Distraction-free coding
  ["folke/zen-mode.nvim"] = {
    cmd = "ZenMode",
    module = "zen-mode",
    config = function()
      require("zen-mode").setup(require "user.plugins.zen-mode")
    end,
  },

  -- nvim-cmp source for emoji
  ["hrsh7th/cmp-emoji"] = {
    after = "nvim-cmp",
    config = function()
      astronvim.add_user_cmp_source "emoji"
    end,
  },

  -- Highlights for text filetypes, like markdown
  ["lukas-reineke/headlines.nvim"] = {
    ft = { "markdown", "rmd" },
    config = function()
      require("headlines").setup(require "user.plugins.headlines")
    end,
  },

  -- Plain text note-taking assistant
  ["mickael-menu/zk-nvim"] = {
    module = { "zk", "zk.commands" },
    config = function()
      require("zk").setup(require "user.plugins.zk")
    end,
  },

  -- Extensions for telescope.nvim
  ["nvim-telescope/telescope-file-browser.nvim"] = {
    after = "telescope.nvim",
    module = "telescope._extensions.file_browser",
    config = function()
      require("telescope").load_extension "file_browser"
    end,
  },
  ["nvim-telescope/telescope-media-files.nvim"] = {
    after = "telescope.nvim",
    config = function()
      require("telescope").load_extension "media_files"
    end,
  },
  ["nvim-telescope/telescope-hop.nvim"] = {
    after = "telescope.nvim",
    config = function()
      require("telescope").load_extension "hop"
    end,
  },
  ["nvim-telescope/telescope-project.nvim"] = {
    after = "telescope.nvim",
    module = "telescope._extensions.project",
    config = function()
      require("telescope").load_extension "project"
    end,
  },
  ["benfowler/telescope-luasnip.nvim"] = {
    after = "telescope.nvim",
    module = "telescope._extensions.luasnip",
    config = function()
      require("telescope").load_extension "luasnip"
    end,
  },

  -- Navigate around your document
  -- Move / Swap elements around
  ["ziontee113/syntax-tree-surfer"] = { module = "syntax-tree-surfer" },

  -- Resolve merge conflicts
  ["akinsho/git-conflict.nvim"] = {
    config = function()
      require("git-conflict").setup(require "user.plugins.git-conflict")
    end,
  },

  -- Programming, Testing, Debugging
  ["mfussenegger/nvim-dap"] = {
    module = "dap",
    config = require "user.plugins.dap",
    requires = {
      {
        "rcarriga/nvim-dap-ui",
        after = "nvim-dap",
        config = require "user.plugins.dapui",
      },
      {
        "theHamsta/nvim-dap-virtual-text",
        after = "nvim-dap",
        config = function()
          require("nvim-dap-virtual-text").setup(require "user.plugins.dap-virtual-text")
        end,
      },
      {
        "nvim-telescope/telescope-dap.nvim",
        after = "telescope.nvim",
        module = "telescope._extensions.dap",
        config = function()
          require("telescope").load_extension "dap"
        end,
      },
    },
  },
  -- Debug Adapter for Lua
  ["jbyuki/one-small-step-for-vimkind"] = {
    requires = { "nvim-dap" },
    module = "osv",
  },
  -- Rust programming
  ["simrat39/rust-tools.nvim"] = {

    ft = { "rust" },
    config = function()
      require("rust-tools").setup(require "user.plugins.rust-tools")
    end,
  },
  ["Saecki/crates.nvim"] = {
    event = { "BufRead Cargo.toml" },
    requires = { "plenary.nvim" },
    config = function()
      require("crates").setup(require "user.plugins.crates")
      astronvim.add_user_cmp_source "crates"
    end,
  },
  -- Flutter programming
  ["akinsho/flutter-tools.nvim"] = {
    requires = { "nvim-dap", "plenary.nvim" },
    config = function()
      require("flutter-tools").setup(require "user.plugins.flutter-tools")
    end,
  },
  -- Go programming
  ["ray-x/go.nvim"] = {
    ft = "go",
    config = function()
      require("go").setup(require "user.plugins.go")
    end,
  },
  -- Testing (Rails, Go)
  ["klen/nvim-test"] = {
    cmd = {
      "TestSuite",
      "TestFile",
      "TestNearest",
      "TestLast",
      "TestVisit",
      "TestEdit",
    },
    config = function()
      require("nvim-test").setup(require "user.plugins.nvim-test")
    end,
  },
  -- sqls language server
  ["nanotee/sqls.nvim"] = { module = "sqls" },

  -- Better quickfix window
  ["kevinhwang91/nvim-bqf"] = {
    ft = "qf",
    config = function()
      require("bqf").setup()
    end,
  },

  ["lewis6991/spaceless.nvim"] = {
    event = "BufEnter",
    config = function()
      require("spaceless").setup()
    end,
  },
}
