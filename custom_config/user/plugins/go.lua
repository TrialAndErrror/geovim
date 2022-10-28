local capabilities = vim.lsp.protocol.make_client_capabilities()
local lsp_ok, cmp_nvim_lsp = require "cmp_nvim_lsp"
if lsp_ok then
  capabilities = cmp_nvim_lsp.update_capabilities(capabilities)
end
local path = require "nvim-lsp-installer.core.path"
local install_root_dir = path.concat { vim.fn.stdpath "data", "lsp_servers" }

return {
  max_line_len = 100,
  goimport = "gopls",
  icons = false,
  gopls_cmd = { install_root_dir .. "/go/gopls" },
  fillstruct = "gopls",
  dap_debug = true,
  dap_debug_gui = true,
  lsp_cfg = {
    capabilities = capabilities,
    settings = {
      gopls = {
        codelenses = {
          generate = true,
          gc_details = false,
          test = true,
          tidy = true,
        },
        analyses = {
          unusedparams = true,
        },
      },
    },
  },
  lsp_gofumpt = true,
  lsp_keymaps = false,
  lsp_on_attach = astronvim.lsp and astronvim.lsp.on_attach or nil,
  lsp_diag_virtual_text = false,
  dap_debug_keymap = false,
  textobjects = false,
}
