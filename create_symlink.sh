#!/bin/bash
set -euo pipefail

# Directory where this script lives (not the launch dir)
SOURCE_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)

# "source:target" pairs — plain array, works on bash 3.2
SYMLINKS=(
    ".tmux.conf:$HOME/.tmux.conf"
    ".zshrc:$HOME/.zshrc"
    ".gitconfig:$HOME/.gitconfig"
    "nvim:$HOME/.config/nvim"
    "ghostty:$HOME/.config/ghostty"
    "yazi:$HOME/.config/yazi"
    "aerospace:$HOME/.config/aerospace"
    "bin/fgfs:$HOME/.local/bin/fgfs"
)

echo "Creating symlinks from $SOURCE_DIR..."

for pair in "${SYMLINKS[@]}"; do
    src="${pair%%:*}"
    target="${pair#*:}"
    link="$SOURCE_DIR/$src"

    # Already linked correctly? Skip.
    if [ -L "$target" ] && [ "$(readlink "$target")" = "$link" ]; then
        echo "OK   $target"
        continue
    fi

    # Ensure parent dir exists (e.g. ~/.config)
    mkdir -p "$(dirname "$target")"

    # Back up an existing file/link without clobbering a prior backup
    if [ -e "$target" ] || [ -L "$target" ]; then
        backup="$target.bak"
        if [ -e "$backup" ] || [ -L "$backup" ]; then
            backup="$target.bak.$(date +%Y%m%d%H%M%S)"
        fi
        echo "Backup  $target -> $backup"
        mv "$target" "$backup"
    fi

    echo "Link    $link -> $target"
    ln -s "$link" "$target"
done

# Shortcut links to locations outside the repo ("source:target" pairs)
GDRIVE_ROOT="$HOME/Library/CloudStorage/GoogleDrive-luca@alignmachines.com"
SHORTCUTS=(
    "$GDRIVE_ROOT/My Drive:$HOME/gdrive"
    "$GDRIVE_ROOT/.shortcut-targets-by-id/1avRPfwfaWKzqSPMQn_9x6zymX4clPOGE/Pilot Testing 廠機手相關/FlightLog:$HOME/align-logs"
    "$HOME/Library/Mobile Documents/com~apple~CloudDocs:$HOME/icloud"
)

for pair in "${SHORTCUTS[@]}"; do
    src="${pair%%:*}"
    target="${pair#*:}"

    if [ -L "$target" ] && [ "$(readlink "$target")" = "$src" ]; then
        echo "OK   $target"
    elif [ -e "$target" ] || [ -L "$target" ]; then
        echo "Skip    $target already exists"
    else
        echo "Link    $src -> $target"
        ln -s "$src" "$target"
    fi
done

echo "All symlinks created successfully!"
