# Neovim Bootstrap Dotfiles
:cherry_blossom: **Resonable** :cherry_blossom: minimal single-file opinionated config to bootstrap your nvim journey.
Clone directory to your `~/.config/nvim`.

Required packages:
- `neovim` (0.11+)
- `wl-copy` for system clipboard sync

One [plugin](https://github.com/nvim-mini/mini.clue.git) is installed if you are on recent nvim versions (0.12+ required), you are free to remove the plugin section from init.lua.

# Learn/practice Vim

>[!CAUTION]
> Do not rush it. Don't try to learn everything at once!

The best way to learn Neovim/Vim is by *doing* — try to solve your editing problems as they come, and look up what you need along the way. However, if you feel lost or unsure where to start, here are some very useful resources you can explore:

### :VimTutor
VimTutor is an interactive tutorial built into Vim and Neovim. It covers the essential editing commands in a step-by-step fashion, perfect for beginners.
Run it from inside `nvim` by typing:

```vim
:vimtutor
```
This will launch a guided lesson that introduces you to **movement, editing, saving, and quitting**.

### :help
Neovim has one of the most comprehensive and well-organized built-in help systems. You can access documentation for any command, function, or option directly inside Neovim.

Use the :help command followed by the topic you want to learn about, for example:

```vim
:help
:help user-manual
:help motion
:help key-mapping
```

>[!TIP]
> Use `:help index` to see the full list of help topics.
> Use `]f` to follow a link in help pages, `CTRL-o` to jump back.

### :VimBeGood
[VimBeGood](https://github.com/ThePrimeagen/vim-be-good.git) is a fun, gamified way to improve your Vim and Neovim skills by practicing real editing challenges. It helps build muscle memory for navigation and editing commands.

You can install it as a **plugin** and run it with:

```vim
:VimBeGood
```

or, you can run a docker image to practice without install anything:

```bash
docker run -it --rm brandoncc/vim-be-good:stable
```

### Vim Scoop
[Vim Scoop](https://vimscoops.dev/) is a very nice online game for learning motions with an ice cream van.
