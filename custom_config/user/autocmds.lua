local utils = require "user.utils"

utils.augroup("autocomp", {
  {
    event = { "VimLeave" },
    description = "Stop running auto compiler",
    pattern = "*",
    command = function()
      vim.fn.jobstart { "autocomp", vim.fn.expand "%:p", "stop" }
    end,
  },
})

utils.augroup("mini", {
  {
    event = { "FileType" },
    description = "Disable indent scope for content types",
    command = function()
      if
        vim.tbl_contains({
          "NvimTree",
          "TelescopePrompt",
          "Trouble",
          "alpha",
          "help",
          "lsp-installer",
          "lspinfo",
          "neo-tree",
          "neogitstatus",
          "packer",
          "startify",
        }, vim.bo.filetype) or vim.tbl_contains({ "nofile", "terminal" }, vim.bo.buftype)
      then
        vim.b.miniindentscope_disable = true
      end
    end,
  },
})


utils.augroup("__env", {
  {
    event = { "BufEnter" },
    pattern = { ".env" },
    command = function(args)
      vim.bo.filetype = ".env"
      vim.diagnostic.disable(args.buf)
    end,
  },
})
