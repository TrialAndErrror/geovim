local cmp_ok, cmp = pcall(require, "cmp")
if cmp_ok then
  return {
    mapping = {
      ["<C-j>"] = cmp.config.disable,
      ["<C-k>"] = cmp.config.disable,
    },
  }
else
  return {}
end
