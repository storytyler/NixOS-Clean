# MCP (Model Context Protocol) Configuration

This document describes the MCP server configuration implemented for the NixOS system, specifically designed to work with Claude Code and other AI agents.

## Overview

The MCP configuration provides a modular, secure way to enable AI agents to interact with system resources through standardized protocols. This implementation uses the `mcp-servers-nix` framework to manage MCP server configurations.

## Architecture

```
/home/player00/NixOS/
├── flake-parts/mcp-ecosystem/          # MCP ecosystem configuration
│   ├── default.nix                    # Main MCP ecosystem module
│   ├── servers/                       # Individual MCP server configs
│   │   ├── default.nix                # Server collection
│   │   ├── filesystem.nix             # File system access
│   │   ├── playwright.nix             # Browser automation
│   │   ├── sequential-thinking.nix    # Advanced reasoning
│   │   ├── github.nix                 # GitHub integration
│   │   └── fetch.nix                  # Web fetching
│   └── agents/                        # Agent-specific configurations
│       ├── default.nix                # Agent collection
│       └── claude-code.nix            # Claude Code agent config
├── modules/services/mcp/               # NixOS service integration
│   └── default.nix                    # MCP service module
└── machines/Station-00/configuration.nix  # System configuration
```

## Available MCP Servers

### Core Servers (Basic Profile)
- **filesystem**: Secure file system access with path restrictions
- **fetch**: Web content fetching capabilities
- **sequential-thinking**: Advanced reasoning and problem-solving
- **playwright**: Browser automation and web testing

### Extended Servers (Development Profile)
- **git**: Git repository management
- **github**: GitHub API integration (requires authentication)
- **memory**: Persistent memory across sessions
- **sqlite**: Database operations

## Configuration Profiles

### System Profiles
- **basic**: Core servers only (filesystem, fetch, sequential-thinking)
- **extended**: Basic + git, github, memory, sqlite
- **full**: All available servers

### Claude Code Agent Profiles
- **basic**: Essential tools for general tasks
- **development**: Full development workflow support
- **automation**: Web automation focused
- **full**: All capabilities enabled

## Security Features

### Path Restrictions
Filesystem access is restricted to specific paths:
- `/home/player00/NixOS` - NixOS configuration
- `/home/player00/Downloads` - Downloads folder
- `/home/player00/Documents` - Documents folder
- `/tmp` - Temporary files

### Authentication
- GitHub integration uses GitHub CLI authentication
- Environment files are supported for sensitive configuration
- Password commands are available for dynamic secret retrieval

## Installation and Setup

### 1. Apply Configuration
```bash
sudo nixos-rebuild switch
```

### 2. Set up GitHub Authentication (Optional)
```bash
gh auth login
```

### 3. Verify Installation
```bash
# Check MCP configurations
ls -la /etc/mcp-configs/

# View Claude Code configuration
cat ~/.config/claude-code/mcp.json | jq

# Use provided aliases
mcp-status
mcp-claude
```

## Usage

### Claude Code Agent
The Claude Code agent automatically uses the MCP configuration located at:
- System: `/home/player00/.config/claude-code/mcp.json`
- Project: `/home/player00/NixOS/.claude/mcp.json`

### Manual MCP Server Testing
```bash
# Test filesystem server
cat /etc/mcp-configs/basic.json

# Test specific server configurations
nix eval .#system.build.mcpConfigs.extended --json | jq
```

## Customization

### Adding New Servers
1. Create server configuration in `flake-parts/mcp-ecosystem/servers/`
2. Add to appropriate profile in `servers/default.nix`
3. Update agent configurations if needed

### Modifying Agent Profiles
Edit `flake-parts/mcp-ecosystem/agents/claude-code.nix` to adjust:
- Allowed file paths
- Server configurations
- Environment variables

### Changing System Profile
Update `machines/Station-00/configuration.nix`:
```nix
services.mcp = {
  profile = "basic|development|full";
  claudeCodeProfile = "basic|development|automation|full";
};
```

## Troubleshooting

### Common Issues

**Configuration Build Failures**
```bash
# Check flake syntax
nix flake check

# Test configuration build
sudo nixos-rebuild dry-build
```

**MCP Server Connection Issues**
```bash
# Check server availability
systemctl status mcp-*

# View logs
journalctl -f | grep -i mcp
```

**GitHub Authentication Issues**
```bash
# Re-authenticate
gh auth logout
gh auth login

# Check authentication status
gh auth status
```

### Debugging Commands
```bash
# View current MCP configuration
mcp-claude

# Check file permissions
ls -la ~/.config/claude-code/

# Test MCP server responses
# (specific commands depend on MCP client implementation)
```

## File Locations

### Configuration Files
- `/etc/mcp-configs/basic.json` - Basic MCP configuration
- `/etc/mcp-configs/extended.json` - Extended MCP configuration
- `/home/player00/.config/claude-code/mcp.json` - Claude Code agent config
- `/home/player00/NixOS/.claude/mcp.json` - Project-specific config

### Log Files
- System logs: `journalctl -u mcp-*`
- Agent logs: Depends on agent implementation

## Environment Variables

- `MCP_CONFIG_DIR=/etc/mcp-configs`
- `CLAUDE_CODE_CONFIG_DIR=/home/player00/.config/claude-code`
- `MCP_CONFIG_BASIC=/etc/mcp-configs/basic.json`
- `MCP_CONFIG_EXTENDED=/etc/mcp-configs/extended.json`

## Future Extensions

The modular design allows for easy addition of:
- New MCP servers
- Additional AI agents
- Custom server configurations
- Advanced security policies
- Multi-user configurations

## References

- [MCP Servers Nix](https://github.com/natsukium/mcp-servers-nix)
- [Model Context Protocol Specification](https://modelcontextprotocol.io/)
- [Claude Code Documentation](https://github.com/sadjow/claude-code-nix)