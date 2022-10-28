-- Formatting and linting
-- https://github.com/jose-elias-alvarez/null-ls.nvim
local status_ok, null_ls = pcall(require, "null-ls")
if status_ok then
  local builtins = null_ls.builtins

  return {
    sources = {
      -- Completion
      -- builtins.completion.spell,
      -- Formatting
      builtins.formatting.shfmt, -- Shell
      builtins.formatting.prettierd.with {
        filetypes = {
          "javascript",
          "typescript",
          "css",
          "scss",
          "html",
          "yaml",
          "markdown",
          "json",
          "svelte",
          "toml",
        },
      },
      -- Linters
      builtins.diagnostics.rubocop, -- Ruby
      builtins.diagnostics.tsc, -- Typescript
      builtins.diagnostics.shellcheck.with {
        diagnostics_format = "#{m} [#{c}]",
      },
      builtins.diagnostics.luacheck.with {
        extra_args = { "--global vim" },
      },
      -- Code Actions
      builtins.code_actions.gitsigns,
      builtins.code_actions.gitrebase,
      builtins.code_actions.shellcheck,
      -- Hover
      builtins.hover.dictionary,
    },
    on_attach = function(client)
      -- Format on save
      if client.resolved_capabilities.document_formatting then
        vim.api.nvim_create_autocmd("BufWritePre", {
          desc = "Auto format before save",
          pattern = "<buffer>",
          callback = function()
            vim.lsp.buf.formatting_sync()
          end,
        })
      end
    end,
  }
end
