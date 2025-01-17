print("Welcome to SaturnVim!")
require("saturn.remap")
require("saturn.lazy")

vim.cmd.colorscheme("catppuccin")

-- vim.cmd.colorscheme("tokyonight")

vim.opt.number = true -- Enable absolute line numbers by default
-- Define an autocmd group for toggling relative line numbers
local numbertoggle_group = vim.api.nvim_create_augroup("numbertoggle", { clear = true })
-- Toggle relative line numbers when entering relevant modes
vim.api.nvim_create_autocmd({ "BufEnter", "FocusGained", "InsertLeave", "WinEnter" }, {
  group = numbertoggle_group,
  pattern = "*",
  callback = function()
    if vim.opt.number:get() and vim.fn.mode() ~= "i" then
      vim.opt.relativenumber = true
    end
  end,
})
-- Disable relative line numbers when leaving relative modes
vim.api.nvim_create_autocmd({ "BufLeave", "FocusLost", "InsertEnter", "WinLeave" }, {
  group = numbertoggle_group,
  pattern = "*",
  callback = function()
    if vim.opt.number:get() then
      vim.opt.relativenumber = false
    end
  end,
})

vim.opt.tabstop = 2 -- Number of sapces that a tab represents
vim.opt.shiftwidth = 2 -- Number of spaces to use for each indentation level
vim.opt.expandtab = true -- Use spaces instead of tabs
vim.opt.autoindent = true -- Copy indent from current line when starting a new one

local rust_group = vim.api.nvim_create_augroup("RustSpecific", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
  group = rust_group,
  pattern = "rust",
  callback = function()
    vim.opt_local.tabstop = 2
    vim.opt_local.shiftwidth = 2
    vim.opt_local.expandtab = true
    vim.opt.autoindent = true
  end,
})

vim.opt.ignorecase = true -- Ignore case when searching
vim.opt.smartcase = true -- Use case-sensitive if you include mixed case in your search

vim.opt.cursorline = true
vim.opt.termguicolors = true
vim.opt.background = "dark" -- Preference for colorschemes that have both light & dark mode
vim.opt.signcolumn = "yes" -- Show sign column so that text doesn't shift

vim.opt.splitright = true -- Split vertical window to the right
vim.opt.splitbelow = true -- Split horizontal window to the bottom

vim.opt.clipboard = "unnamedplus" -- Use system clipboard
vim.opt.swapfile = false -- Turn off swapfile creation, not recommended / save often / use autosave
