-- vim.schedule(function()
vim.pack.add({
  {
    src = 'gh:neovim/nvim-lspconfig',
    version = 'master',
  },
})

vim.lsp.enable('clangd')
vim.lsp.enable('pyright')
vim.lsp.enable('jdtls')
vim.lsp.enable('lua_ls')
vim.lsp.enable('bashls')
-- TODO: Add Kotlin

vim.lsp.enable('copilot')
vim.lsp.inline_completion.enable()
vim.keymap.set('i', '<c-e>', vim.lsp.inline_completion.get)

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('lsp-attach', { clear = true }),
  callback = function(event)
    -- Rename the variable under your cursor.
    --  Most Language Servers support renaming across files, etc.
    vim.keymap.set('n', 'grn', vim.lsp.buf.rename, { desc = '[R]e[n]ame' })

    -- Execute a code action, usually your cursor needs to be on top of an error
    -- or a suggestion from your LSP for this to activate.
    vim.keymap.set({ 'n', 'x' }, 'gra', vim.lsp.buf.code_action, { desc = '[G]oto Code [A]ction' })

    -- Find references for the word under your cursor.
    vim.keymap.set('n', 'grr', function()
      vim.cmd 'vsplit'
      require('telescope.builtin').lsp_references()
    end, { desc = '[G]oto [R]eferences' })

    -- Jump to the implementation of the word under your cursor.
    --  Useful when your language has ways of declaring types without an actual implementation.
    vim.keymap.set('n', 'gri', function()
      vim.cmd 'vsplit'
      require('telescope.builtin').lsp_implementations()
    end, { desc = '[G]oto [I]mplementation' })

    -- Jump to the definition of the word under your cursor.
    --  This is where a variable was first declared, or where a function is defined, etc.
    --  To jump back, press <C-t>.
    vim.keymap.set('n', 'grd', function()
      vim.cmd 'vsplit'
      require('telescope.builtin').lsp_definitions()
    end, { desc = '[G]oto [D]efinition' })

    -- WARN: This is not Goto Definition, this is Goto Declaration.
    --  For example, in C this would take you to the header.
    vim.keymap.set('n', 'grD', function()
      vim.cmd 'vsplit'
      vim.lsp.buf.declaration()
    end, { desc = '[G]oto [D]eclaration' })

    -- Fuzzy find all the symbols in your current document.
    --  Symbols are things like variables, functions, types, etc.
    vim.keymap.set('n', 'gO', require('telescope.builtin').lsp_document_symbols, { desc = 'Open Document Symbols' })

    -- Fuzzy find all the symbols in your current workspace.
    --  Similar to document symbols, except searches over your entire project.
    vim.keymap.set('n', 'gW', require('telescope.builtin').lsp_dynamic_workspace_symbols,
      { desc = 'Open Workspace Symbols' })

    -- Jump to the type of the word under your cursor.
    --  Useful when you're not sure what type a variable is and you want to see
    --  the definition of its *type*, not where it was *defined*.
    vim.keymap.set('n', 'grt', function()
      vim.cmd 'vsplit'
      require('telescope.builtin').lsp_type_definitions()
    end, { desc = '[G]oto [T]ype Definition' })
    --
    -- gR-prefixed mappings: open in current window
    vim.keymap.set('n', 'gRr', function() require('telescope.builtin').lsp_references() end,
      { desc = '[G]oto [R]eferences (current window)' })
    vim.keymap.set('n', 'gRi', function() require('telescope.builtin').lsp_implementations() end,
      { desc = '[G]oto [I]mplementation (current window)' })
    vim.keymap.set('n', 'gRd', function() require('telescope.builtin').lsp_definitions() end,
      { desc = '[G]oto [D]efinition (current window)' })
    vim.keymap.set('n', 'gRD', function() vim.lsp.buf.declaration() end,
      { desc = '[G]oto [D]eclaration (current window)' })
    vim.keymap.set('n', 'gRO', function() require('telescope.builtin').lsp_document_symbols() end,
      { desc = 'Open Document Symbols (current window)' })
    vim.keymap.set('n', 'gRW', function() require('telescope.builtin').lsp_dynamic_workspace_symbols() end,
      { desc = 'Open Workspace Symbols (current window)' })
    vim.keymap.set('n', 'gRt', function() require('telescope.builtin').lsp_type_definitions() end,
      { desc = '[G]oto [T]ype Definition (current window)' })

    -- This function resolves a difference between neovim nightly (version 0.11) and stable (version 0.10)
    ---@param client vim.lsp.Client
    ---@param method vim.lsp.protocol.Method
    ---@param bufnr? integer some lsp support methods only in specific files
    ---@return boolean
    local function client_supports_method(client, method, bufnr)
      return client:supports_method(method, bufnr)
    end

    -- The following two autocommands are used to highlight references of the
    -- word under your cursor when your cursor rests there for a little while.
    --    See `:help CursorHold` for information about when this is executed
    --
    -- When you move your cursor, the highlights will be cleared (the second autocommand).
    local client = vim.lsp.get_client_by_id(event.data.client_id)
    if client and client_supports_method(client, vim.lsp.protocol.Methods.textDocument_documentHighlight, event.buf) then
      local highlight_augroup = vim.api.nvim_create_augroup('kickstart-lsp-highlight',
        { clear = false })
      vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
        buffer = event.buf,
        group = highlight_augroup,
        callback = vim.lsp.buf.document_highlight,
      })

      vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
        buffer = event.buf,
        group = highlight_augroup,
        callback = vim.lsp.buf.clear_references,
      })

      vim.api.nvim_create_autocmd('LspDetach', {
        group = vim.api.nvim_create_augroup('kickstart-lsp-detach', { clear = true }),
        callback = function(event2)
          vim.lsp.buf.clear_references()
          vim.api.nvim_clear_autocmds { group = 'kickstart-lsp-highlight', buffer = event2.buf }
        end,
      })
    end

    -- The following code creates a keymap to toggle inlay hints in your
    -- code, if the language server you are using supports them
    --
    -- This may be unwanted, since they displace some of your code
    if client and client_supports_method(client, vim.lsp.protocol.Methods.textDocument_inlayHint, event.buf) then
      vim.keymap.set('n', '<leader>th', function()
        vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { bufnr = event.buf })
      end, { desc = '[T]oggle Inlay [H]ints' })
    end
  end,
})
-- end)
