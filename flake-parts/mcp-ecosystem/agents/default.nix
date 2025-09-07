# MCP Agents Configuration
# Agent-specific MCP configurations for different AI agents

{ inputs, pkgs, lib, ... }:

let
  mcp-servers-nix = inputs.mcp-servers-nix;
  mkMcpConfig = serverConfig: mcp-servers-nix.lib.mkConfig pkgs {
    flavor = "claude-code";
    programs = serverConfig;
  };
in
{
  # Agent configurations
  agents = {
    # Claude Code - Primary development agent
    claude-code = {
      # Basic configuration for general tasks
      basic = mkMcpConfig {
        filesystem = {
          enable = true;
          args = [ 
            "/home/player00/NixOS"
            "/tmp"
          ];
        };
        fetch = {
          enable = true;
        };
        sequential-thinking = {
          enable = true;
        };
      };
      
      # Development configuration with full access
      development = mkMcpConfig {
        filesystem = {
          enable = true;
          args = [ 
            "/home/player00/NixOS"
            "/home/player00/Downloads"
            "/home/player00/Documents"
            "/tmp"
          ];
        };
        fetch = {
          enable = true;
        };
        playwright = {
          enable = true;
          env = {
            PLAYWRIGHT_HEADLESS = true;
            PLAYWRIGHT_BROWSERS_PATH = "${pkgs.playwright-driver.browsers}";
          };
        };
        sequential-thinking = {
          enable = true;
          env = {
            SEQUENTIAL_THINKING_MODE = "advanced";
            MAX_THINKING_STEPS = "50";
          };
        };
        git = {
          enable = true;
        };
        github = {
          enable = true;
          passwordCommand = {
            GITHUB_PERSONAL_ACCESS_TOKEN = [ "gh" "auth" "token" ];
          };
        };
        memory = {
          enable = true;
        };
      };
      
      # Web automation focused configuration
      automation = mkMcpConfig {
        playwright = {
          enable = true;
          env = {
            PLAYWRIGHT_HEADLESS = false;  # Show browser for debugging
            PLAYWRIGHT_BROWSERS_PATH = "${pkgs.playwright-driver.browsers}";
          };
        };
        fetch = {
          enable = true;
          env = {
            USER_AGENT = "Claude-Code-Automation/1.0";
            TIMEOUT = "60000";  # Longer timeout for automation
          };
        };
        sequential-thinking = {
          enable = true;
        };
        filesystem = {
          enable = true;
          args = [ "/tmp" "/home/player00/Downloads" ];
        };
      };
    };
    
    # Future: Other agents can be configured here
    # research-agent = { ... };
    # coding-assistant = { ... };
  };
  
  # Default agent configuration (Claude Code basic)
  default = agents.claude-code.basic;
}