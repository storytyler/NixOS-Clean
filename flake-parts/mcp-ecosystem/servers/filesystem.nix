# Filesystem MCP Server Configuration
# Provides secure file system access for AI agents

{ inputs, pkgs, lib, ... }:

let
  mcp-servers-nix = inputs.mcp-servers-nix;
in
{
  # Filesystem server with secure path restrictions
  filesystem = {
    basic = mcp-servers-nix.lib.mkConfig pkgs {
      programs.filesystem = {
        enable = true;
        args = [
          "/home/player00/NixOS"      # NixOS configuration access
          "/tmp"                      # Temporary files
        ];
      };
    };
    
    extended = mcp-servers-nix.lib.mkConfig pkgs {
      programs.filesystem = {
        enable = true;
        args = [
          "/home/player00/NixOS"      # NixOS configuration
          "/home/player00/Downloads"  # Downloads folder
          "/home/player00/Documents"  # Documents folder
          "/tmp"                      # Temporary files
          "/var/log"                  # System logs (read-only access)
        ];
      };
    };
    
    development = mcp-servers-nix.lib.mkConfig pkgs {
      programs.filesystem = {
        enable = true;
        args = [
          "/home/player00"           # Full home directory access for development
          "/tmp"                     # Temporary files
          "/var/log"                 # System logs
        ];
      };
    };
  };
}