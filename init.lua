
local D = os.getenv("DOTFILES") or os.getenv("HOME") .. "/.dotfiles"
local o = vim.o

-- This is a magic line that will take your pain away.
o.rtp = string.format("%s/neovim,%s", D, o.rtp)

-- Vanilla Config
require "plugins"
require "settings"

