return {
  colorscheme = "duskfox",

  updater = { skip_prompts = true },

  cmp = {
    source_priority = {
      nvim_lsp = 700,
      crates = 600,
      path = 500,
      buffer = 250,
    },
  },

  polish = function()
    require "user.autocmds"
  end,
}
