# Telescope Live Grep Oldfiles

An extension for [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) that allows you to grep in your recently openend files within Neovim.
Quickly fuzzy finding your latest files was always one of my favorite telescope features. A lot of times however I have a certain string in mind rather
than the actual file. With this feature, it is easy to jump right into your work context without knowning the exact file you had openend.


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

## Usage
You can call live-grep-oldfiles either directly as a command.

```lua
require("telescope").extensions.live_grep_oldfiles.find()
```

Or map it to a keybinding in your config.

```lua
maps.n["<leader>fo"] = {
    function() require("telescope").extensions.live_grep_oldfiles.find() end,
    desc = "Live grep over oldfiles",
  }
```
