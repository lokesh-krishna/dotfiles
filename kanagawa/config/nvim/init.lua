-- plugin manager setup
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- leader!
vim.g.mapleader = ','

require("lazy").setup( "plugins",
{
  ui = {
    size = {
      width = 0.7,
      height = 0.7
    },
    border = "rounded"
  }
})

require("config")
