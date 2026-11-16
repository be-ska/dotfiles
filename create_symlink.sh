#!/bin/bash
set -euo pipefail

# Directory where this script lives (not the launch dir)
SOURCE_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)

# "source:target" pairs — plain array, works on bash 3.2
SYMLINKS=(
    ".tmux.conf:$HOME/.tmux.conf"
    ".zshrc:$HOME/.zshrc"
    "nvim:$HOME/.config/nvim"
    "ghostty:$HOME/.config/ghostty"
    "yazi:$HOME/.config/yazi"
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

echo "All symlinks created successfully!"
