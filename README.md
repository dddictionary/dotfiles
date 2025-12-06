# Tmux Configuration

Personal tmux configuration with Rose Pine theme.

## Installation

### Quick Install

```bash
git clone https://github.com/dddictionary/dotfiles ~/dotfiles
~/dotfiles/install.sh
```

If the Kanagawa patch fails during install, apply it manually after starting tmux:
```bash
~/dotfiles/apply-patch.sh
```

### Manual Install

1. Clone this repository:
   ```bash
   git clone https://github.com/dddictionary/dotfiles ~/dotfiles
   ```

2. Create symbolic links:
   ```bash
   ln -sf ~/dotfiles/.tmux.conf ~/.tmux.conf
   ln -sf ~/dotfiles/.tmux ~/.tmux
   ln -sf ~/dotfiles/.gitconfig ~/.gitconfig
   ```

3. Install TPM (Tmux Plugin Manager):
   ```bash
   git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
   ```

4. Install plugins:
   - Start tmux
   - Press `Prefix + I` (Ctrl+a then Shift+i) to install plugins

5. Apply Kanagawa theme patch:
   ```bash
   patch -p1 -d ~/.tmux/plugins/tmux < ~/dotfiles/rose-pine-kanagawa.patch
   ```

## Notes

- The tmux theme uses Rose Pine with custom Kanagawa colors
- The patch is automatically applied when using `install.sh`
