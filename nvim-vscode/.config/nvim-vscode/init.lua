if vim.g.vscode then
  local map = vim.keymap.set
  local opts = { noremap = true, silent = true }

  local function vscode_call(command)
    vim.fn.VSCodeNotify(command)
  end

  local function vscode_extension_call(command, arg)
    vim.fn.VSCodeExtensionNotify(command, arg, 0)
  end

  -- Load VS Code Neovim keymaps and settings
  -- Set leader key
  map("n", "<Space>", "", opts)
  vim.g.mapleader = " "
  vim.g.maplocalleader = " "

  -- Differentiate deleting vs cutting
  map({ "n", "x" }, "d", "\"_d")
  map({ "n", "x" }, "D", "\"_D")
  map({ "n", "x" }, "c", "\"_c")
  map({ "n", "x" }, "C", "\"_C")
  map({ "n", "x" }, "s", "\"_s")
  map({ "n", "x" }, "S", "\"_S")
  map("n", "x", "d")
  map("n", "X", "D")
  map("n", "xx", "dd")

  -- Clipboard
  map({ "n", "x" }, "<leader>p", "\"+p")
  map({ "n", "x" }, "<leader>P", "\"+P")
  map({ "n", "x" }, "<leader>y", "\"+y")
  map({ "n", "x" }, "<leader>Y", "\"+Y", { remap = true })
  map({ "n", "x" }, "<leader>x", "\"+x")
  map({ "n", "x" }, "<leader>X", "\"+X", { remap = true })

  -- General keymaps
  map("n", "<leader>nh", "<cmd>nohl<CR>") -- Remove search highlight

  -- Tab management
  map("n", "<leader>tn", function()
    vscode_extension_call("open-file", "__vscode_new__")
  end, opts)

  map("n", "<leader>tc", function()
    vscode_call("workbench.action.closeActiveEditor")
  end, opts)

  map("n", "<leader>]", function()
    vscode_call("workbench.action.nextEditorInGroup")
  end, opts)

  map("n", "<leader>[", function()
    vscode_call("workbench.action.previousEditorInGroup")
  end, opts)

  -- Word change
  map({ "n", "x" }, "<leader>cn", "*Ncgn", { remap = true })
  map({ "n", "x" }, "<leader>cN", "*NcgN", { remap = true })

  -- Highlight yanked text
  vim.api.nvim_create_autocmd("TextYankPost", {
    callback = function()
      vim.highlight.on_yank({ higroup = "IncSearch", timeout = 200 }) -- Change "IncSearch" to another highlight group if needed
    end
  })

  -- LSP
  -- Jump to next error/warning
  map("n", "[d", function()
    vscode_call("editor.action.marker.next")
  end, opts)

  -- Jump to previous error/warning
  map("n", "]d", function()
    vscode_call("editor.action.marker.prev")
  end, opts)

  -- Show floating diagnostics on hover
  map("n", "<leader>d", function()
    vim.fn.VSCodeNotify("editor.action.showHover")
  end, opts)

  -- Open problems panel
  map("n", "<leader>td", function()
    vscode_call("workbench.actions.view.problems")
  end, opts)

  -- === Rename Variable ===
  map("n", "<leader>rn", function()
    vscode_call("editor.action.rename")
  end, opts)

  -- === Find References ===
  map("n", "gr", function()
    vscode_call("editor.action.referenceSearch.trigger")
  end, opts)


  -- GitHub Copilot Keybindings
  map("i", "<M-e>", function()
    vscode_call("editor.action.inlineSuggest.commit")
  end, opts)

  map("i", "<M-n>", function()
    vscode_call("editor.action.inlineSuggest.trigger")
  end, opts)

  map("i", "<M-c>", function()
    vscode_call("editor.action.inlineSuggest.hide")
  end, opts)
end
