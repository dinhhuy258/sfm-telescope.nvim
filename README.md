# sfm-telescope

The `sfm-telescope` extension is a plugin for the [sfm](https://github.com/dinhhuy258/sfm.nvim) plugin that allows users to search entries in the sfm explorer.

## Installation

To install the `sfm-entry` extension, you will need to have the [sfm](https://github.com/dinhhuy258/sfm.nvim) and [telescope](https://github.com/nvim-telescope/telescope.nvim) plugins installed. You can then install the extension using your preferred plugin manager. For example, using [packer.nvim](https://github.com/wbthomason/packer.nvim):

```lua
{
  "dinhhuy258/sfm.nvim",
  requires = {
    { "dinhhuy258/sfm-telescope.nvim" },
  },
  config = function()
    local sfm_explorer = require("sfm").setup {}
    sfm_explorer:load_extension "sfm-telescope"
  end
}
```

## Configuration

The `sfm-telescope` plugin provides the following configuration options:

```lua
local default_config = {
  mappings = {
    search = { "/" },
  },
}
```

You can override the default configuration in `load_extension` method

```lua
sfm_explorer:load_extension("sfm-telescope", {
  mappings = {
    search = { "s" },
  },
})
```
