return {
  ["<leader>"] = {
    n = {
      name = "Notes",
      s = { ":'<,'>lua require('zk.commands').get('ZkMatch')()<cr>", "Search" },
      n = {
        ":'<,'>lua require('zk.commands').get('ZkNewFromTitleSelection')({ dir = 'personal' })<cr>",
        "New Personal Note From Title",
      },
      N = {
        ":'<,'>lua require('zk.commands').get('ZkNewFromTitleSelection')({ dir = 'work' })<cr>",
        "New Work Note From Title",
      },
      W = {
        ":'<,'>lua require('zk.commands').get('ZkNewFromContentSelection')({ dir = 'work', title = vim.fn.input('Title: ') })<cr>",
        "New Work Note From Content",
      },
      C = {
        ":'<,'>lua require('zk.commands').get('ZkNewFromContentSelection')({ dir = 'personal', title = vim.fn.input('Title: ') })<cr>",
        "New Personal Note From Content",
      },
    },
  },
}
