-- Override default options
return {
  opt = {
    conceallevel = 2, -- enable conceal
    foldenable = false,
    foldexpr = "nvim_treesitter#foldexpr()", -- set Treesitter based folding
    foldmethod = "expr",
    linebreak = true, -- linebreak soft wrap at words
    list = true, -- show whitespace characters
    listchars = { tab = "│→", extends = "⟩", precedes = "⟨", trail = "·", nbsp = "␣", eol = " " },
    shortmess = vim.opt.shortmess + { I = true },
    showbreak = "↪ ",
    spellfile = "~/.config/nvim/lua/user/spell/en.utf-8.add",
    thesaurus = "~/.config/nvim/lua/user/spell/mthesaur.txt",
    wrap = true, -- soft wrap lines
  },
}
