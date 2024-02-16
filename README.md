# Telescope Live Grep Oldfiles

An extension for [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) that allows you to grep in your recently openend files within Neovim.


## Installation

```vim
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'incptr/telescope-live-grep-oldfiles'
```

Using lazy
```lua

  {
    "incptr/telescope-live-grep-oldfiles.nvim",
    dependencies = { -- note how they're inverted to above example
      {
        "nvim-telescope/telescope.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
      },
    },
    config = function(_, opts)
      -- Calling telescope's setup from multiple specs does not hurt, it will happily merge the
      -- configs for us. We won't use data, as everything is in it's own namespace (telescope
      -- defaults, as well as each extension).
      require("telescope").setup(opts)
      require("telescope").load_extension "telescope-live-grep-oldfiles"
    end,
  },

```
