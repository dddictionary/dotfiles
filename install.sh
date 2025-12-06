#!/usr/bin/env bash

# Dotfiles installation script

echo "Creating symbolic links..."
ln -sf ~/dotfiles/.tmux.conf ~/.tmux.conf
ln -sf ~/dotfiles/.tmux ~/.tmux
ln -sf ~/dotfiles/.gitconfig ~/.gitconfig

echo "Installing TPM (Tmux Plugin Manager)..."
if [ ! -d ~/.tmux/plugins/tpm ]; then
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi

echo "Installing tmux plugins..."
~/.tmux/plugins/tpm/bin/install_plugins

echo "Applying Kanagawa theme patch to Rose Pine..."
if [ ! -d ~/.tmux/plugins/tmux ]; then
    echo "Error: Rose Pine plugin directory not found at ~/.tmux/plugins/tmux"
    echo "Please install plugins manually:"
    echo "  1. Start tmux"
    echo "  2. Press Prefix + I to install plugins"
    echo "  3. Run: patch -p1 -d ~/.tmux/plugins/tmux < ~/dotfiles/rose-pine-kanagawa.patch"
    exit 1
fi

if [ -f ~/dotfiles/rose-pine-kanagawa.patch ]; then
    if patch -p1 -d ~/.tmux/plugins/tmux < ~/dotfiles/rose-pine-kanagawa.patch; then
        echo "Kanagawa theme patch applied!"
    else
        echo "Warning: Patch may have already been applied or failed"
    fi
else
    echo "Warning: rose-pine-kanagawa.patch not found"
fi

echo "Done! Restart tmux or press Prefix + r to reload config."
