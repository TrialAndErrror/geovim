return {
  close_if_last_window = false,
  enable_diagnostics = true,
  window = {
    position = "left",
    width = 35,
  },
  event_handlers = {
    {
      event = "after_render",
      handler = function(_)
        if vim.bo.filetype == "neo-tree" then
          local status_ok, alpha = pcall(require, "alpha")
          if status_ok then
            alpha.redraw()
          end
        end
      end,
    },
  },
}
