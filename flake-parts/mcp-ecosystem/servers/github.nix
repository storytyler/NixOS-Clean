# GitHub MCP Server Configuration
# Provides GitHub integration capabilities with secure authentication

{ inputs, pkgs, lib, ... }:

let
  mcp-servers-nix = inputs.mcp-servers-nix;
in
{
  # GitHub server configurations
  github = {
    basic = mcp-servers-nix.lib.mkConfig pkgs {
      programs.github = {
        enable = true;
        # Use GitHub CLI for authentication
        passwordCommand = {
          GITHUB_PERSONAL_ACCESS_TOKEN = [ "gh" "auth" "token" ];
        };
      };
    };
    
    with-env-file = mcp-servers-nix.lib.mkConfig pkgs {
      programs.github = {
        enable = true;
        # Alternative: use environment file for token
        envFile = /home/player00/.config/github/mcp-token;
      };
    };
    
    development = mcp-servers-nix.lib.mkConfig pkgs {
      programs.github = {
        enable = true;
        passwordCommand = {
          GITHUB_PERSONAL_ACCESS_TOKEN = [ "gh" "auth" "token" ];
        };
        env = {
          GITHUB_API_BASE_URL = "https://api.github.com";
          GITHUB_ENABLE_DRAFT_PR = "true";
        };
      };
    };
  };
  
  # Required system packages for GitHub integration
  systemPackages = with pkgs; [
    gh          # GitHub CLI
    git         # Git version control
    curl        # HTTP client
  ];
  
  # Setup instructions (as comments for reference)
  # To configure GitHub authentication:
  # 1. Run: gh auth login
  # 2. Or create token file: echo "ghp_xxxx" > ~/.config/github/mcp-token
  # 3. Ensure proper permissions: chmod 600 ~/.config/github/mcp-token
}