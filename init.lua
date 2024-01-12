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

package.path = package.path .. ";" .. "/Users/rustemhutiev/.luarocks/share/lua/5.1/?/init.lua"
package.path = package.path .. ";" .. "/Users/rustemhutiev/.luarocks/share/lua/5.1/?.lua"

require("settings")
require("lazy").setup("plugins")

require("keymappings") -- Keymappings for all the plugins
-- Example for configuring Neovim to load user-installed installed Lua rocks:
