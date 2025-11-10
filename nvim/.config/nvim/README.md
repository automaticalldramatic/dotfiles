# 💤 LazyVim

A starter template for [LazyVim](https://github.com/LazyVim/LazyVim).
Refer to the [documentation](https://lazyvim.github.io/installation) to get started.

## Stow Management

This Neovim configuration is managed with **GNU Stow** for symlink creation. After adding or modifying files in this directory, you must run stow to create/update symlinks.

### Essential Stow Commands

From the dotfiles repository root:

**Create/update symlinks (run after adding new files):**
```bash
stow nvim
```

**View what stow will do (preview changes):**
```bash
stow -v nvim    # Verbose - shows each symlink operation
stow -n nvim    # No-op - dry run, shows what would happen
```

**Remove all symlinks:**
```bash
stow -D nvim    # -D = --delete
```

**Recreate symlinks (useful if things got out of sync):**
```bash
stow --restow nvim
```

### Important

Always run `stow nvim` after creating new files in `nvim/.config/nvim/lua/plugins/` or other subdirectories. Without this, new configuration files won't be symlinked to `~/.config/nvim/` and won't be loaded by Neovim.
