#!/usr/bin/env bash

# MCP Setup and Validation Script
# This script helps setup and validate the MCP configuration

set -euo pipefail

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo -e "${BLUE}=== MCP Configuration Setup and Validation ===${NC}"

# Function to print status
print_status() {
    echo -e "${GREEN}✓${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}⚠${NC} $1"
}

print_error() {
    echo -e "${RED}✗${NC} $1"
}

print_info() {
    echo -e "${BLUE}ℹ${NC} $1"
}

# Check if we're in the right directory
if [[ ! -f "flake.nix" ]]; then
    print_error "Not in NixOS configuration directory. Please run from /home/player00/NixOS"
    exit 1
fi

print_info "Validating MCP configuration files..."

# Check if MCP ecosystem files exist
MCP_FILES=(
    "flake-parts/mcp-ecosystem/default.nix"
    "flake-parts/mcp-ecosystem/servers/default.nix"
    "flake-parts/mcp-ecosystem/agents/default.nix"
    "modules/services/mcp/default.nix"
)

for file in "${MCP_FILES[@]}"; do
    if [[ -f "$file" ]]; then
        print_status "Found $file"
    else
        print_error "Missing $file"
        exit 1
    fi
done

# Validate flake syntax
print_info "Validating flake syntax..."
if nix flake check --no-build 2>/dev/null; then
    print_status "Flake syntax is valid"
else
    print_warning "Flake validation failed - this might be expected if dependencies aren't available"
fi

# Check if GitHub CLI is available (needed for GitHub MCP server)
if command -v gh &> /dev/null; then
    print_status "GitHub CLI is available"
    if gh auth status &>/dev/null; then
        print_status "GitHub CLI is authenticated"
    else
        print_warning "GitHub CLI is not authenticated. Run 'gh auth login' to enable GitHub MCP server"
    fi
else
    print_warning "GitHub CLI not found. Install it to use GitHub MCP server"
fi

# Create necessary directories
print_info "Setting up MCP directories..."
mkdir -p "$HOME/.config/claude-code"
mkdir -p "$HOME/NixOS/.claude"

print_status "MCP directories created"

# Set up environment for testing
print_info "Setting up environment..."

# Check if we can build the configuration
print_info "Testing configuration build..."
if sudo nixos-rebuild dry-build &>/dev/null; then
    print_status "Configuration builds successfully"
else
    print_error "Configuration build failed. Check the logs with: sudo nixos-rebuild dry-build"
    exit 1
fi

echo
echo -e "${GREEN}=== MCP Setup Complete ===${NC}"
echo
echo "Next steps:"
echo "1. Apply configuration: sudo nixos-rebuild switch"
echo "2. Check MCP configs: ls -la /etc/mcp-configs/"
echo "3. View Claude Code config: cat ~/.config/claude-code/mcp.json | jq"
echo "4. Set up GitHub auth (if needed): gh auth login"
echo
echo "Available MCP shell aliases:"
echo "  - mcp-status: Show MCP configuration files"
echo "  - mcp-claude: View Claude Code MCP configuration"
echo "  - mcp-logs: Watch MCP-related logs"