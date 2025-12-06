#!/usr/bin/env bash

# Apply Kanagawa theme patch to Rose Pine

if [ ! -d ~/.tmux/plugins/tmux ]; then
    echo "Error: Rose Pine plugin not installed"
    echo "Please install it first:"
    echo "  1. Start tmux"
    echo "  2. Press Prefix + I (Ctrl+a then Shift+i)"
    echo "  3. Then run this script again"
    exit 1
fi

echo "Applying Kanagawa theme patch to Rose Pine plugin..."
if [ -f ~/dotfiles/rose-pine-kanagawa.patch ]; then
    if patch -p1 -d ~/.tmux/plugins/tmux < ~/dotfiles/rose-pine-kanagawa.patch; then
        echo "✓ Rose Pine plugin patched successfully!"
    else
        echo "✗ Plugin patch failed (may already be applied)"
    fi
else
    echo "Error: rose-pine-kanagawa.patch not found"
    exit 1
fi

echo "Applying Kanagawa variant to .tmux.conf..."
if [ -f ~/dotfiles/tmux-conf-kanagawa.patch ]; then
    if patch -p0 -d ~ < ~/dotfiles/tmux-conf-kanagawa.patch; then
        echo "✓ .tmux.conf updated successfully!"
    else
        echo "✗ .tmux.conf patch failed (may already be applied)"
    fi
else
    echo "Error: tmux-conf-kanagawa.patch not found"
    exit 1
fi

# Reload tmux config if tmux is running
if tmux info &> /dev/null; then
    echo "Reloading tmux configuration..."
    tmux source-file ~/.tmux.conf
    echo "✓ Done! Kanagawa theme is now active."
else
    echo "✓ Done! Start tmux to see the Kanagawa theme."
fi
