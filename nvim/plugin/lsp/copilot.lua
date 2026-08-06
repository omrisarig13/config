-- vim.schedule(function()
  vim.pack.add({
    {
      src = 'gh:github/copilot.vim',
      version = 'release',
    },
  })

  vim.g.copilot_no_maps = true
  -- Block the normal Copilot suggestions
  vim.api.nvim_create_augroup("github_copilot", { clear = true })
  vim.api.nvim_create_autocmd({ "FileType", "BufUnload" }, {
    group = "github_copilot",
    callback = function(args)
      vim.fn["copilot#On" .. args.event]()
    end,
  })
  vim.fn["copilot#OnFileType"]()

-- end)
