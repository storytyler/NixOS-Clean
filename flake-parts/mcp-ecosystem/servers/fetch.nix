# Fetch MCP Server Configuration
# Provides web fetching capabilities for retrieving online content

{ inputs, pkgs, lib, ... }:

let
  mcp-servers-nix = inputs.mcp-servers-nix;
in
{
  # Fetch server configurations
  fetch = {
    basic = mcp-servers-nix.lib.mkConfig pkgs {
      programs.fetch = {
        enable = true;
        # Basic web fetching capabilities
      };
    };
    
    with-user-agent = mcp-servers-nix.lib.mkConfig pkgs {
      programs.fetch = {
        enable = true;
        env = {
          USER_AGENT = "Claude-Code-MCP/1.0";
          TIMEOUT = "30000";  # 30 second timeout
        };
      };
    };
    
    advanced = mcp-servers-nix.lib.mkConfig pkgs {
      programs.fetch = {
        enable = true;
        env = {
          USER_AGENT = "Claude-Code-MCP/1.0";
          TIMEOUT = "30000";
          MAX_REDIRECTS = "10";
          ENABLE_COOKIES = "true";
        };
      };
    };
  };
  
  # Required system packages for fetch operations
  systemPackages = with pkgs; [
    curl        # HTTP client
    wget        # Alternative downloader
    ca-certificates  # SSL certificates
  ];
}