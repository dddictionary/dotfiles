# Tmux Configuration

Personal tmux configuration with Rose Pine theme.

## Installation

1. Clone this repository:
   ```bash
   git clone <your-repo-url> ~/dotfiles
   ```

2. Create symbolic links:
   ```bash
   ln -sf ~/dotfiles/.tmux.conf ~/.tmux.conf
   ln -sf ~/dotfiles/.tmux ~/.tmux
   ```

3. Install TPM (Tmux Plugin Manager):
   ```bash
   git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
   ```

4. Install plugins:
   - Start tmux
   - Press `Prefix + I` (Ctrl+a then Shift+i) to install plugins

## Features

- Custom prefix: `Ctrl+a`
- Rose Pine Moon theme
- Vim-style copy mode
- Mouse support enabled
- Custom pane splitting with `|` and `-`
