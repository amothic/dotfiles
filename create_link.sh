#!/bin/bash
set -eu

cd "$(dirname "$0")"
DOTFILES_DIR="$PWD"

# Directories that need special handling (contents are linked individually)
SPECIAL_DIRS=(".config" ".claude")

# Patterns to exclude from linking
EXCLUDE_PATTERNS=(
    "*.local.*"
    ".gitkeep"
    ".*.swp"
)

# Create symlink with idempotency
# Returns 0 if link created/already correct, 1 if skipped due to existing file
create_link() {
    local src="$1"
    local dest="$2"

    # Already a correct symlink
    if [ -L "$dest" ] && [ "$(readlink "$dest")" = "$src" ]; then
        return 0
    fi

    # Exists but not a symlink - don't overwrite
    if [ -e "$dest" ] && [ ! -L "$dest" ]; then
        echo "Warning: $dest exists and is not a symlink, skipping"
        return 1
    fi

    ln -sf "$src" "$dest"
}

# Check if filename matches any exclude pattern
should_exclude() {
    local filename="$1"
    for pattern in "${EXCLUDE_PATTERNS[@]}"; do
        case "$filename" in
            $pattern) return 0 ;;
        esac
    done
    return 1
}

# Check if directory is in SPECIAL_DIRS
is_special_dir() {
    local dir="$1"
    for special in "${SPECIAL_DIRS[@]}"; do
        [ "$dir" = "$special" ] && return 0
    done
    return 1
}

# Link contents of a special directory recursively
link_special_dir() {
    local src_dir="$1"
    local dest_dir="$2"

    # If dest_dir is already a symlink pointing to src_dir, skip
    if [ -L "$dest_dir" ] && [ "$(readlink "$dest_dir")" = "$src_dir" ]; then
        return 0
    fi

    mkdir -p "$dest_dir"

    for item in "$src_dir"/*; do
        [ -e "$item" ] || continue

        local item_name
        item_name=$(basename "$item")
        should_exclude "$item_name" && continue

        local dest_item="$dest_dir/$item_name"

        if [ -f "$item" ]; then
            create_link "$item" "$dest_item"
        elif [ -d "$item" ]; then
            # If directory itself is already correctly linked, skip
            if [ -L "$dest_item" ] && [ "$(readlink "$dest_item")" = "$item" ]; then
                continue
            fi
            # Recursively handle subdirectories
            link_special_dir "$item" "$dest_item"
        fi
    done
}

# Main: Link dotfiles in repository root
for dotfile in .?*; do
    [ "$dotfile" = ".." ] && continue
    [[ "$dotfile" == .git* ]] && continue
    is_special_dir "$dotfile" && continue

    create_link "$DOTFILES_DIR/$dotfile" "$HOME/$dotfile"
done

# Main: Link contents of special directories
for special_dir in "${SPECIAL_DIRS[@]}"; do
    if [ -d "$DOTFILES_DIR/$special_dir" ]; then
        link_special_dir "$DOTFILES_DIR/$special_dir" "$HOME/$special_dir"
    fi
done
