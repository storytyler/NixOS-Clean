# MCP Servers Configuration
# Individual server configurations for the MCP ecosystem

{ inputs, pkgs, lib, ... }:

let
  mcp-servers-nix = inputs.mcp-servers-nix;
  mkMcpConfig = serverConfig: mcp-servers-nix.lib.mkConfig pkgs {
    flavor = "claude-code";
    programs = serverConfig;
  };
in
{
  # Import all server configurations
  imports = [
    ./filesystem.nix
    ./playwright.nix
    ./sequential-thinking.nix
    ./github.nix
    ./fetch.nix
  ];

  # Common server configurations
  servers = {
    # Core development servers
    core = mkMcpConfig {
      filesystem.enable = true;
      fetch.enable = true;
      sequential-thinking.enable = true;
    };
    
    # Web automation servers
    automation = mkMcpConfig {
      playwright.enable = true;
      fetch.enable = true;
    };
    
    # Development workflow servers
    development = mkMcpConfig {
      filesystem.enable = true;
      git.enable = true;
      github.enable = true;
      sequential-thinking.enable = true;
    };
    
    # Full feature set
    complete = mkMcpConfig {
      filesystem.enable = true;
      fetch.enable = true;
      playwright.enable = true;
      sequential-thinking.enable = true;
      git.enable = true;
      github.enable = true;
      memory.enable = true;
      sqlite.enable = true;
    };
  };
}