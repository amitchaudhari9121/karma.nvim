# 🏙 Karma

![Screenshot of Karma, split between the light and dark mode](screenshots/ScreenshotSplit.png)

## ⚡️ Requirements

- Neovim >= 0.5.0

## 📦 Installation

Install the theme with your preferred package manager:

With [`vim-plug`](https://github.com/junegunn/vim-plug):

```vim
Plug 'amitchaudhari9121/karma.nvim', { 'branch': 'main' }
```

With [`packer`](https://github.com/wbthomason/packer.nvim):

```lua
use 'amitchaudhari9121/karma.nvim'
```

## 🚀 Usage

Enable the colorscheme:

```vim
" Enable karma in Vim Script
colorscheme karma
```

```lua
-- Enable karma colorscheme in lua
vim.cmd[[colorscheme karma]]
```

To enable the `Karma` theme for `Lualine`, simply specify it in your lualine settings:

```lua
require('lualine').setup {
  options = {
    -- ... your lualine config
    theme = 'karma'
    -- ... your lualine config
  }
}
```

To enable the `karma` colorscheme for `lightline`:

```vim
" Vim Script
let g:lightline = {'colorscheme': 'karma'}
```
> ❗️ Note: if you are using tmux or similar multiplexers , please make sure that you add these for a color accurate experience of karma.nvim

replace `XXX` with the output of `echo $TERM`

```          
set-option -sa terminal-overrides ',XXX:RGB' # newer versions of tmux
set-option -ga terminal-overrides ',XXX:Tc'  # older versions of tmux 

```  

## ⚙️ Configurationn

> ❗️ You must set the configuration **BEFORE** loading the color scheme with `colorscheme karma`

The themes come with a darker `night` variant, and a lighter `day` theme. 

For instance, you could set the theme to `day` by:

- `vim.g.karma_style == "day"`
-  `vim.o.background == "light"`

| Option                         | Default   | Description                                                                                                                                                     |
| ------------------------------ | --------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| karma_style                    | `"storm"` | The theme comes in two styles a darker variant `night` and `day`.                                                                                               |
| karma_terminal_colors          | `true`    | Configure the colors used when opening a `:terminal` in Neovim                                                                                                  |
| karma_italic_comments          | `true`    | Make comments italic                                                                                                                                            |
| karma_italic_keywords          | `true`    | Make keywords italic                                                                                                                                            |
| karma_italic_functions         | `false`   | Make functions italic                                                                                                                                           |
| karma_italic_variables         | `false`   | Make variables and identifiers italic                                                                                                                           |
| karma_transparent              | `false`   | Enable this to disable setting the background color                                                                                                             |
| karma_hide_inactive_statusline | `false`   | Enabling this option, will hide inactive statuslines and replace them with a thin border instead. Should work with the standard **StatusLine** and **LuaLine**. |
| karma_sidebars                 | `{}`      | Set a darker background on sidebar-like windows. For example: `["qf", "vista_kind", "terminal", "packer"]`                                                      |
| karma_transparent_sidebar      | `false`   | Sidebar like windows like `NvimTree` get a transparent background                                                                                               |
| karma_dark_sidebar             | `true`    | Sidebar like windows like `NvimTree` get a darker background                                                                                                    |
| karma_dark_float               | `true`    | Float windows like the lsp diagnostics windows get a darker background.                                                                                         |
| karma_colors                   | `{}`      | You can override specific color groups to use other groups or a hex color                                                                                       |
| karma_day_brightness           | `0.3`     | Adjusts the brightness of the colors of the **Day** style. Number between 0 and 1, from dull to vibrant colors                                                  |
| karma_lualine_bold             | `false`   | When `true`, section headers in the lualine theme will be bold                                                                                                  |

```lua
-- Example config in Lua
vim.g.karma_style = "night"
vim.g.karma_italic_functions = true
vim.g.karma_sidebars = { "qf", "vista_kind", "terminal", "packer" }

-- Change the "hint" color to the "yellow2" color, and make the "error" color bright red
vim.g.karma_colors = { hint = "yellow2", error = "#ff0000" }

-- Load the colorscheme
vim.cmd[[colorscheme karma]]
```

```vim
" Example config in VimScript
let g:karma_style = "night"
let g:karma_italic_functions = 1
let g:karma_sidebars = [ "qf", "vista_kind", "terminal", "packer" ]

" Change the "hint" color to the "yellow2" color, and make the "error" color bright red
let g:karma_colors = {
  \ 'hint': 'yellow2',
  \ 'error': '#ff0000'
\ }

" Load the colorscheme
colorscheme karma
```

### Making `undercurls` work in tmux

To have undercurls show up and in color, add the following to your **tmux** config file:

```sh
# Undercurl
set -g default-terminal "${TERM}"
set -as terminal-overrides ',*:Smulx=\E[4::%p1%dm'  # undercurl support
set -as terminal-overrides ',*:Setulc=\E[58::2::%p1%{65536}%/%d::%p1%{256}%/%{255}%&%d::%p1%{255}%&%d%;m'  # underscore colours - needs tmux-3.0
```

## Info

This theme is a port of [karma](https://github.com/sreetamdas/karma).

Much of the Lua util and color assigning is inspired by [NightFox.nvim](https://github.com/EdenEast/nightfox.nvim) and [tokyonight.nvim](https://github.com/folke/tokyonight.nvim).

## ✨ Features

- Supports the latest Neovim 5.0 features like TreeSitter and LSP
- Minimal inactive statusline
- Vim terminal colors
- Darker background for sidebar-like windows
- **Lualine** theme

### Plugin Support

- [x] [TreeSitter](https://github.com/nvim-treesitter/nvim-treesitter)
- [x] [LSP Diagnostics](https://neovim.io/doc/user/lsp.html)
- [x] [LSP Trouble](https://github.com/folke/lsp-trouble.nvim)
- [x] [LSP Saga](https://github.com/glepnir/lspsaga.nvim)
- [x] [Git Signs](https://github.com/lewis6991/gitsigns.nvim)
- [x] [Git Gutter](https://github.com/airblade/vim-gitgutter)
- [x] [Telescope](https://github.com/nvim-telescope/telescope.nvim)
- [ ] [NvimTree](https://github.com/kyazdani42/nvim-tree.lua)
- [ ] [WhichKey](https://github.com/liuchengxu/vim-which-key)
- [ ] [Indent Blankline](https://github.com/lukas-reineke/indent-blankline.nvim)
- [ ] [Dashboard](https://github.com/glepnir/dashboard-nvim)
- [ ] [BufferLine](https://github.com/akinsho/nvim-bufferline.lua)
- [x] [Lualine](https://github.com/hoob3rt/lualine.nvim)
- [x] [Lightline](https://github.com/itchyny/lightline.vim)
- [ ] [Neogit](https://github.com/TimUntersberger/neogit)
- [ ] [vim-sneak](https://github.com/justinmk/vim-sneak)
- [ ] [Fern](https://github.com/lambdalisue/fern.vim)
- [ ] [Barbar](https://github.com/romgrk/barbar.nvim)


## 🎨 Palette
![Karma's color palette](screenshots/Palette.png)

## 🔥 Contributing

Pull requests are welcome. 

I know this theme is not as polished right now as it can be, nor can I test the theme on every terminal I know of. Users are encouraged to create and file an issue about any problems they've faced.
