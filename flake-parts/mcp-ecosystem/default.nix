# MCP Ecosystem Configuration
# This module provides MCP (Model Context Protocol) server configurations
# for AI agents like Claude Code, supporting various MCP servers for enhanced functionality.

{ inputs, pkgs, lib, config, ... }:

let
  # Import MCP servers from the mcp-servers-nix flake input
  mcp-servers-nix = inputs.mcp-servers-nix;
  
  # Common MCP configuration for all agents
  mkMcpConfig = serverConfig: mcp-servers-nix.lib.mkConfig pkgs {
    flavor = "claude-code"; # Optimized for Claude Code agent
    programs = serverConfig;
  };

  # Base MCP servers configuration
  baseMcpServers = {
    # Filesystem access for code operations
    filesystem = {
      enable = true;
      args = [ 
        "/home/player00/NixOS"  # Allow access to NixOS configuration
        "/tmp"                   # Allow temporary file access
        "/home/player00/Downloads" # Allow downloads access
      ];
    };
    
    # Web fetching capabilities
    fetch = {
      enable = true;
      # No additional configuration needed for basic web fetching
    };
    
    # Browser automation and testing
    playwright = {
      enable = true;
      # Uses system Playwright installation
    };
    
    # Enhanced reasoning capabilities
    sequential-thinking = {
      enable = true;
      # Provides advanced reasoning and problem-solving capabilities
    };
  };

  # Extended MCP servers for development workflows  
  extendedMcpServers = baseMcpServers // {
    # Git operations
    git = {
      enable = true;
      # Provides Git repository management capabilities
    };
    
    # GitHub integration (requires authentication)
    github = {
      enable = true;
      # Will need to configure authentication via envFile or passwordCommand
      passwordCommand = {
        GITHUB_PERSONAL_ACCESS_TOKEN = [ "gh" "auth" "token" ];
      };
    };
    
    # Memory/persistence capabilities
    memory = {
      enable = true;
      # Provides persistent memory across sessions
    };
    
    # SQLite database operations
    sqlite = {
      enable = true;
      # Provides SQLite database access and operations
    };
  };

in
{
  options.mcp-ecosystem = {
    enable = lib.mkEnableOption "MCP ecosystem with various server configurations";
    
    profile = lib.mkOption {
      type = lib.types.enum [ "basic" "extended" "full" ];
      default = "basic";
      description = ''
        MCP server profile to use:
        - basic: Core servers (filesystem, fetch, playwright, sequential-thinking)
        - extended: Basic + git, github, memory, sqlite
        - full: All available servers
      '';
    };
    
    customServers = lib.mkOption {
      type = lib.types.attrsOf lib.types.attrs;
      default = {};
      description = "Custom MCP server configurations to add or override";
    };
    
    agents = lib.mkOption {
      type = lib.types.attrsOf lib.types.attrs;
      default = {};
      description = "Agent-specific MCP configurations";
    };
  };

  config = lib.mkIf config.mcp-ecosystem.enable {
    # Create MCP configuration files
    environment.systemPackages = with pkgs; [
      # Tools commonly needed by MCP servers
      curl
      git
      gh  # GitHub CLI for authentication
      sqlite
      nodejs_22  # For Node.js based MCP servers
    ];

    # Export MCP configurations for different profiles
    system.build.mcpConfigs = {
      basic = mkMcpConfig baseMcpServers;
      extended = mkMcpConfig extendedMcpServers;
      # Add more profiles as needed
    };

    # Create symlinks to MCP configurations in appropriate locations
    system.activationScripts.mcp-configs = ''
      mkdir -p /etc/mcp-configs
      ln -sf ${config.system.build.mcpConfigs.basic} /etc/mcp-configs/basic.json
      ln -sf ${config.system.build.mcpConfigs.extended} /etc/mcp-configs/extended.json
    '';

    # Add environment variables for MCP configuration paths
    environment.variables = {
      MCP_CONFIG_BASIC = "/etc/mcp-configs/basic.json";
      MCP_CONFIG_EXTENDED = "/etc/mcp-configs/extended.json";
    };
  };
}