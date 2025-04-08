<h1 align="center">✨ NeoVim configuration  ✨</h1>

## 📦 Requirements

### For `3rd/image.nvim` plugin used to NeoTree

**Überzug++**

`brew install jstkdng/programs/ueberzugpp`

Setup config `~/.config/ueberzugpp/config.json`

```json
{
  "layer": {
    "silent": true,
    "use-escape-codes": false,
    "no-stdin": false,
    "_comment": "Replace wayland in output with iterm2, if you want ssh support, x11 if you want to use it in xorg, sixel if you want to use sixels, chafa if you want to use the terminal colors.",
    "_comment2": "Kitty is not mentioned in the list above, because image.nvim has native support for it.",
    "output": "wayland"
  }
}
```

**ImageMagick**

```sh
brew install luarocks
luarocks install magick
```

---

## ⌨️ Mappings

### Base

| Key     | Description                     | Mode |
| ------- | ------------------------------- | ---- |
| jj      | Escape to normal mode           | I    |
| \<C-s\> | Save file and go to normal mode | I, N |

### Neotree

| Key         | Description        | Mode |
| ----------- | ------------------ | ---- |
| \<leader\>e | Open file explorer | N    |

## ⭐️ Utils

### `merge`

This util function helps to combine two objects.

```lua
local merge = require("utils.merge").merge

local first = { foo = "Hello" }
local second = { bar = "World" }

local mergedObject = merge(first, second) -- { foo = "Hello", bar = "World" }
```

---

## 🔌 Plugins

### UI

- [nvim-neo-tree/neo-tree.nvim](https://github.com/nvim-neo-tree/neo-tree.nvim) - used for file explorer
- [nvim-treesitter/nvim-treesitter](https://github.com/nvim-treesiter/nvim-treesiter) - used for hilight code

### LSP

- [williamboman/mason.nvim](https://github.com/williamboman/mason.nvim) - used for install LSP
- [williamboman/mason-lspconfig.nvim](https://github.com/williamboman/mason-lspconfig.nvim) - used for install all LSP by default via Mason
- [WhoIsSethDaniel/mason-tool-installer.nvim](https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim) - used for install another from LSP to Mason
- [neovim/nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) - used for connect NeoVim and LSP
- [hrsh7th/nvim-cmp](httsp://hithub.com/hrsh7th/nvim-cmp) - used for show autocomplets and suggestions (This plugin in deps have a lot of another plugins which help to connect to lsp or just simplify life)

### Linting

- [stevearc/conform.nvim](https://github.com/stevearc/conform.nvim) - used for formating files
