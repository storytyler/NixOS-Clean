# Sequential Thinking MCP Server Configuration
# Provides advanced reasoning and problem-solving capabilities

{ inputs, pkgs, lib, ... }:

let
  mcp-servers-nix = inputs.mcp-servers-nix;
in
{
  # Sequential thinking server configurations
  sequential-thinking = {
    basic = mcp-servers-nix.lib.mkConfig pkgs {
      programs.sequential-thinking = {
        enable = true;
        # Basic reasoning capabilities
      };
    };
    
    advanced = mcp-servers-nix.lib.mkConfig pkgs {
      programs.sequential-thinking = {
        enable = true;
        env = {
          # Enable advanced reasoning features
          SEQUENTIAL_THINKING_MODE = "advanced";
          MAX_THINKING_STEPS = "50";
          ENABLE_REFLECTION = "true";
        };
      };
    };
    
    debug = mcp-servers-nix.lib.mkConfig pkgs {
      programs.sequential-thinking = {
        enable = true;
        env = {
          # Enable debug mode for development
          SEQUENTIAL_THINKING_DEBUG = "true";
          LOG_LEVEL = "debug";
        };
      };
    };
  };
}