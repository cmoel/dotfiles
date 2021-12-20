return require("packer").startup(function(use)
  local cfg = function(plugin_name)
    require("cmoel.plugins." .. plugin_name)
  end

  use "wbthomason/packer.nvim"

  use "christoomey/vim-tmux-navigator"
  use "christoomey/vim-tmux-runner"
  cfg "vim-tmux-runner"
  use "tpope/vim-commentary"
  use "tpope/vim-eunuch"
  use "tpope/vim-obsession"
  use "tpope/vim-rails"
  use "tpope/vim-repeat"
  use "tpope/vim-sleuth"
  use "tpope/vim-speeddating"
  use "tpope/vim-surround"
  use "vim-ruby/vim-ruby"
  use "vim-test/vim-test"
  cfg "vim-test"
end)
