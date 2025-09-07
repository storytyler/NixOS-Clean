# Playwright MCP Server Configuration
# Provides browser automation capabilities for web testing and interaction

{ inputs, pkgs, lib, ... }:

let
  mcp-servers-nix = inputs.mcp-servers-nix;
in
{
  # Playwright server configurations
  playwright = {
    basic = mcp-servers-nix.lib.mkConfig pkgs {
      programs.playwright = {
        enable = true;
        # Use system Playwright installation
      };
    };
    
    headless = mcp-servers-nix.lib.mkConfig pkgs {
      programs.playwright = {
        enable = true;
        env = {
          PLAYWRIGHT_HEADLESS = true;
          PLAYWRIGHT_BROWSERS_PATH = "${pkgs.playwright-driver.browsers}";
        };
      };
    };
    
    development = mcp-servers-nix.lib.mkConfig pkgs {
      programs.playwright = {
        enable = true;
        env = {
          PLAYWRIGHT_HEADLESS = false;  # Show browser for debugging
          PLAYWRIGHT_BROWSERS_PATH = "${pkgs.playwright-driver.browsers}";
          PLAYWRIGHT_SKIP_BROWSER_DOWNLOAD = "1";  # Use system browsers
        };
      };
    };
  };
  
  # Required system packages for Playwright
  systemPackages = with pkgs; [
    playwright-driver
    nodejs_22
    # Browser dependencies
    chromium
    firefox
  ];
}