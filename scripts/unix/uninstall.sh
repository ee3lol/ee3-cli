#!/bin/bash

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo -e "${YELLOW}🚀 Uninstalling ee3 CLI...${NC}"

# Remove binary
echo -e "🗑️  Removing ee3 binary..."
sudo rm -f $(which ee3) 2>/dev/null

# Remove from cargo if installed via cargo
if command -v cargo &> /dev/null; then
    echo -e "🗑️  Removing cargo installation..."
    cargo uninstall ee3 2>/dev/null || true
fi

# Remove from shell config
echo -e "🔍 Cleaning up shell configuration..."
SHELL_CONFIGS=(
    "$HOME/.zshrc"
    "$HOME/.bashrc"
    "$HOME/.bash_profile"
    "$HOME/.bash_login"
    "$HOME/.profile"
    "$HOME/.config/fish/config.fish"
)

for config in "${SHELL_CONFIGS[@]}"; do
    if [ -f "$config" ]; then
        echo -e "  🧹 Cleaning $config"
        # Remove ee3 function and any related lines
        sed -i '' '/^# EE3 CLI FUNCTIONS/,/^# END EE3 CLI FUNCTIONS/d' "$config" 2>/dev/null || true
        sed -i '' '/ee3()/d' "$config" 2>/dev/null || true
    fi
done

echo -e "\n${GREEN}✅ ee3 has been uninstalled!${NC}"
echo -e "\n${YELLOW}ℹ️  You may need to restart your terminal or run 'source ~/.zshrc' (or your shell's config file) to apply changes.${NC}"