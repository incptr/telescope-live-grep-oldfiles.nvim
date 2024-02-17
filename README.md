# Telescope Live Grep Oldfiles

An extension for [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) that allows you to grep in your recently openend files within Neovim.


## Installation
### Using vim-plug
```vim
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'incptr/telescope-live-grep-oldfiles'
```

### Using lazy
```lua

  {
    "incptr/telescope-live-grep-oldfiles.nvim",
    dependencies = {
      {
        "nvim-telescope/telescope.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
      },
    },
    config = function(_, opts)
      require("telescope").setup(opts)
      require("telescope").load_extension "live_grep_oldfiles"
    end,
  },

```
