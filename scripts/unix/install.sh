#!/bin/bash
set -e

# Colors for output
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# Detect OS and architecture
OS="$(uname -s | tr '[:upper:]' '[:lower:]')"
ARCH="$(uname -m)"

# Map architecture to standard names
case "$ARCH" in
    x86_64)
        ARCH="x86_64"
        ;;
    arm64|aarch64)
        ARCH="aarch64"
        ;;
    *)
        echo -e "${RED}❌ Unsupported architecture: $ARCH${NC}"
        exit 1
        ;;
esac

# Map OS to standard names
case "$OS" in
    darwin*)
        OS="apple-darwin"
        ;;
    linux*)
        OS="unknown-linux-gnu"
        ;;
    *)
        echo -e "${RED}❌ Unsupported OS: $OS${NC}"
        exit 1
        ;;
esac

BINARY_NAME="ee3-${ARCH}-${OS}"
INSTALL_DIR="/usr/local/bin"
TEMP_DIR=$(mktemp -d)

# Cleanup function
cleanup() {
    rm -rf "$TEMP_DIR"
}
trap cleanup EXIT

echo -e "${YELLOW}🚀 Installing ee3 CLI...${NC}"

# Check for local binary first
LOCAL_BINARY="./target/release/ee3"
if [ -f "$LOCAL_BINARY" ]; then
    echo -e "${GREEN}✅ Found local binary. Using it for installation.${NC}"
    cp "$LOCAL_BINARY" "$TEMP_DIR/ee3"
else
    # Download the binary
    echo -e "⬇️  Downloading ee3 binary for ${ARCH}-${OS}..."
    if ! curl -sL "https://github.com/ee3lol/ee3-cli/releases/latest/download/${BINARY_NAME}" -o "$TEMP_DIR/ee3"; then
        echo -e "${RED}❌ Failed to download ee3 binary. Please check your internet connection.${NC}"
        echo -e "${YELLOW}ℹ️  You can build the binary locally with: cargo build --release${NC}"
        exit 1
    fi
fi

# Make binary executable
chmod +x "$TEMP_DIR/ee3"

# Install binary
echo -e "🔧 Installing ee3 to ${INSTALL_DIR}..."
if ! sudo mv "$TEMP_DIR/ee3" "$INSTALL_DIR/"; then
    echo -e "${YELLOW}⚠️  Couldn't write to ${INSTALL_DIR}, trying with sudo...${NC}"
    sudo mkdir -p "$INSTALL_DIR"
    sudo mv "$TEMP_DIR/ee3" "$INSTALL_DIR/"
fi

# Verify installation
if ! command -v ee3 &> /dev/null; then
    echo -e "${YELLOW}⚠️  Couldn't add ee3 to PATH. You may need to add ${INSTALL_DIR} to your PATH.${NC}"
    exit 1
fi

echo -e "${GREEN}✅ Successfully installed ee3!${NC}"

# Run ee3 init
echo -e "\n${YELLOW}🔄 Running ee3 init to set up shell integration...${NC}"
ee3 init

# Get the shell config file path
shell_config=$(ee3 init --dry-run 2>&1 | grep "Would write to" | awk '{print $3}' || true)

if [ -n "$shell_config" ]; then
    echo -e "\n${GREEN}🎉 Installation complete!${NC}"
    echo -e "\nTo start using ee3, run:"
    echo -e "  ${YELLOW}source $shell_config${NC}"
    echo -e "\nOr simply open a new terminal window."
else
    echo -e "\n${YELLOW}ℹ️  Please run 'ee3 init' manually to set up shell integration.${NC}"
fi

echo -e "\nTo verify your installation, run:"
echo -e "  ${YELLOW}ee3 --version${NC}"