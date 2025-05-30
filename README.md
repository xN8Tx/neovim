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

### FZF for telescope fzf

`brew install fzf`

---

## ⌨️ Mappings

### Base

| Key         | Description                     | Mode |
| ----------- | ------------------------------- | ---- |
| jj          | Escape to normal mode           | I    |
| \<C-s\>     | Save file and go to normal mode | I, N |
| \<leader\>K | Show diagnostic buffer          | N    |

### Neotree

| Key         | Description        | Mode |
| ----------- | ------------------ | ---- |
| \<leader\>e | Open file explorer | N    |

### Telescope

| Key          | Description    | Mode |
| ------------ | -------------- | ---- |
| \<leader\>ff | Find file      | N    |
| \<leader\>fw | Find by world  | N    |
| \<leader\>fb | Watch buffers  | N    |
| \<leader\>th | Theme Switcher | N    |
| gd           | Go defenition  | N    |
| gr           | Go reference   | N    |

### Codemium

| Key     | Description              | Mode |
| ------- | ------------------------ | ---- |
| \<C-a\> | Codemium accept          | I    |
| \<C-]\> | Codemium next suggestion | I    |
| \<C-[\> | Codemium prev suggestion | I    |
| \<C-x\> | Codemium cancel          | I    |

### Emmet

| Key          | Description  | Mode |
| ------------ | ------------ | ---- |
| \<leader\>ee | Expand Emmet | I    |

### Barbar

| Key         | Description                  | Mode |
| ----------- | ---------------------------- | ---- |
| `<Tab>`     | Next buffer                  | N    |
| `<S-Tab>`   | Previous buffer              | N    |
| `X`         | Close current buffer         | N    |
| `<leader>X` | Close all but current buffer | N    |

### Which-key

| Key         | Description               | Mode |
| ----------- | ------------------------- | ---- |
| `<leader>?` | Show buffer local keymaps | N    |

## ⭐️ Utils

### `merge`

This util function helps to combine two objects.

```lua
local merge = require("utils.merge").merge

local first = { foo = "Hello" }
local second = { bar = "World" }

local mergedObject = merge(first, second) -- { foo = "Hello", bar = "World" }
```

### `russian-mappings`

This util function helps to create russian mappings.

```lua
-- Russian keyboard map
local russianMapings = require("utils.russian-mapings").russian

russianMapings()
```

### `opts-description`

This util function helps to create default mapings options with description.

```lua
local optsWithDesc = require("utils.opts-description").optsWithDesc
local map = vim.keymap.set

map("i", "jj", "<Esc>", optsWithDesc "Escape to normal mode")
```

---

## 🔌 Plugins

### UI

- [nvim-neo-tree/neo-tree.nvim](https://github.com/nvim-neo-tree/neo-tree.nvim) – used as a file explorer with icon support, handy keybindings, and auto-refresh on file changes.
- [nvim-treesitter/nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) – provides advanced syntax highlighting and code parsing using Tree-sitter.
- [romgrk/barbar.nvim](https://github.com/romgrk/barbar.nvim) – tabline plugin for managing buffers with icons, modified status, pinned tabs, and custom keymaps.
- [nvim-lualine/lualine.nvim](https://github.com/nvim-lualine/lualine.nvim) – statusline plugin with theme support, icon integration, and highly customizable layout.

### LSP

- [williamboman/mason.nvim](https://github.com/williamboman/mason.nvim) - used for install LSP
- [williamboman/mason-lspconfig.nvim](https://github.com/williamboman/mason-lspconfig.nvim) - used for install all LSP by default via Mason
- [WhoIsSethDaniel/mason-tool-installer.nvim](https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim) - used for install another from LSP to Mason
- [neovim/nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) - used for connect NeoVim and LSP
- [hrsh7th/nvim-cmp](httsp://hithub.com/hrsh7th/nvim-cmp) - used for show autocomplets and suggestions (This plugin in deps have a lot of another plugins which help to connect to lsp or just simplify life)
- [Exafunction/windsurf.vim](https://github.com/Exafunction/windsurf.vim) - add codemium AI to Neovim
- [mattn/emmet-vim](https://github.com/mattn/emmet-vim) - add Emmet to Neovim

### Linting

- [stevearc/conform.nvim](https://github.com/stevearc/conform.nvim) - used for formating files

### Telescope

- [nvim-telescope/telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) - used to fast searching files by word and naming
- [nvim-telescope/telescope-fzf-native.nvim](https://github.com/nvim-telescope/telescope-fzf-native.nvim) - setup fzf search to telecsope
- [andrew-george/telescope-themes](https://github.com/andrew-george/telescope-themes) - used to fast switch colorschemes

### Misc

- [windwp/nvim-autopairs](https://github.com/windwp/nvim-autopairs) – automatically inserts matching pairs (e.g., `()`, `[]`, `{}`, `""`) while typing in insert mode.
- [folke/which-key.nvim](https://github.com/folke/which-key.nvim) – displays a popup with available keybindings as you type, making it easier to discover and remember mappings.
- [filipdutescu/renamer.nvim](https://github.com/filipdutescu/renamer.nvim) – a neovim plugin that allows you to rename variables in the current buffer.
- [rhysd/git-messenger.vim](https://github.com/rhysd/git-messenger.vim) – displays the commit info about selected line.
- [MagicDuck/grug-far.nvim](https://github.com/MagicDuck/grug-far.nvim) – used for multiple rename in all project
- [lukas-reineke/indent-blankline.nvim](https://github.com/lukas-reineke/indent-blankline.nvim) – adds indentation guides to empty lines

---

## Good to know

### FZF Cheat code

| Token     | Match type                 | Description                          |
| --------- | -------------------------- | ------------------------------------ |
| `sbtrkt`  | fuzzy-match                | Items that match `sbtrkt`            |
| `'wild`   | exact-match (quoted)       | Items that include `wild`            |
| `^music`  | prefix-exact-match         | Items that start with `music`        |
| `.mp3$`   | suffix-exact-match         | Items that end with `.mp3`           |
| `!fire`   | inverse-exact-match        | Items that do not include `fire`     |
| `!^music` | inverse-prefix-exact-match | Items that do not start with `music` |
| `!.mp3$`  | inverse-suffix-exact-match | Items that do not end with `.mp3`    |
