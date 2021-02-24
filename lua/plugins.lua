
vim.cmd [[packadd packer.nvim]]
-- Only if your version of Neovim doesn't have https://github.com/neovim/neovim/pull/12632 merged
-- vim._update_package_paths()

vim.cmd [[ autocmd BufWritePost plugins.lua PackerCompile ]]

return require('packer').startup(function()
  -- Packer can manage itself as an optional plugin
    use {'wbthomason/packer.nvim', opt = true}
    use {'blackcauldron7/surround.nvim'}
    use {'morhetz/gruvbox'} -- Colorscheme
    use {'vim-airline/vim-airline'}
    use {'mhinz/vim-startify'}
    use {'voldikss/vim-floaterm'}
    use {'preservim/nerdtree'}
    use {'psliwka/vim-smoothie'}
    use {'luochen1990/rainbow'}
    use {'jiangmiao/auto-pairs'}
    -- Plug 'wincent/command-t'
    use {'liuchengxu/vim-which-key'}
    --  use {'wellle/context.vim'}
    -- Plug 'jakobkogler/Algorithm-DataStructures'
    -- Plug 'prabirshrestha/vim-lsp'
    -- Plug 'mattn/vim-lsp-settings'
    -- Plug 'vim-scripts/vim-auto-save'
    -- Plug 'prabirshrestha/asyncomplete.vim'
    -- Plug 'prabirshrestha/asyncomplete-lsp.vim'
    -- Plug 'prettier/vim-prettier'
    -- Plug 'ctrlpvim/ctrlp.vim'
    -- Plug 'knubie/vim-kitty-navigator'
    
    -- Lazy loading:
    -- Load on specific commands
    -- use {'tpope/vim-dispatch', opt = true, cmd = {'Dispatch', 'Make', 'Focus', 'Start'}}

    -- Load on an autocommand event
    use {'andymass/vim-matchup', event = 'VimEnter *'}

    -- Load on a combination of conditions: specific filetypes or commands
    -- Also run code after load (see the "config" key)
  use {
    'w0rp/ale',
    ft = {'sh', 'zsh', 'bash', 'c', 'cpp', 'cmake', 'html', 'markdown', 'racket', 'vim', 'tex'},
    cmd = 'ALEEnable',
    config = 'vim.cmd[[ALEEnable]]'
  }

  -- Plugins can have dependencies on other plugins
  use {
    'haorenW1025/completion-nvim',
    opt = true,
    requires = {{'hrsh7th/vim-vsnip', opt = true}, {'hrsh7th/vim-vsnip-integ', opt = true}}
  }
  end)
