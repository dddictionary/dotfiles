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

if [ -f ~/dotfiles/rose-pine-kanagawa.patch ]; then
    echo "Applying Kanagawa theme patch..."
    if patch -p1 -d ~/.tmux/plugins/tmux < ~/dotfiles/rose-pine-kanagawa.patch; then
        echo "✓ Kanagawa theme patch applied successfully!"
        echo "Reload tmux config with: Prefix + r"
    else
        echo "✗ Patch failed (may already be applied)"
    fi
else
    echo "Error: rose-pine-kanagawa.patch not found"
    exit 1
fi
