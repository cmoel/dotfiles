if require "cmoel.first_load"() then
  return
end

vim.g.mapleader = " "

require("cmoel.settings")
require("cmoel.mappings")
require("cmoel.plugins")
require("cmoel.autocommands")
require("cmoel.theme")
