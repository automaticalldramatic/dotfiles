# 💤 LazyVim

Inspired by the starter template for [LazyVim](https://github.com/LazyVim/LazyVim).
Refer to the [documentation](https://lazyvim.github.io/installation) to get started.

## Stow Management

Managed with **GNU Stow** from the dotfiles root:

```bash
stow --no-folding -d . -t ~ -v nvim
```

**Common commands:**
```bash
stow --no-folding -d . -t ~ -n nvim    # Dry run - preview changes
stow --no-folding -d . -t ~ -D nvim    # Remove symlinks
```

After adding new files, run the main command to update symlinks.
