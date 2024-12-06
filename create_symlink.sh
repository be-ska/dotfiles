#!/bin/bash

# Get the current directory (where the script is launched)
SOURCE_DIR=$(pwd)

# Define the list of files and directories to symlink
declare -A SYMLINKS=(
    [".tmux.conf"]="$HOME/.tmux.conf"
    ["nvim"]="$HOME/.config/nvim"
    [".zshrc"]="$HOME/.zshrc"
)

echo "Creating symlinks from $SOURCE_DIR..."

# Loop through the files and directories to create symlinks
for src in "${!SYMLINKS[@]}"; do
    target="${SYMLINKS[$src]}"

    # Check if the target already exists
    if [ -e "$target" ] || [ -L "$target" ]; then
        echo "Backup existing $target to $target.bak"
        mv -f "$target" "$target.bak"
    fi

    # Create the symlink
    echo "Linking $SOURCE_DIR/$src -> $target"
    ln -s "$SOURCE_DIR/$src" "$target"
done

echo "All symlinks created successfully!"
