# Claude Code Agent MCP Configuration
# Specialized configurations for the Claude Code agent

{ inputs, pkgs, lib, config, ... }:

let
  mcp-servers-nix = inputs.mcp-servers-nix;
  mkMcpConfig = serverConfig: mcp-servers-nix.lib.mkConfig pkgs {
    flavor = "claude-code";
    programs = serverConfig;
  };
in
{
  options.claude-code-agent = {
    enable = lib.mkEnableOption "Claude Code agent MCP configuration";
    
    profile = lib.mkOption {
      type = lib.types.enum [ "basic" "development" "automation" "full" ];
      default = "development";
      description = "Claude Code agent configuration profile";
    };
    
    allowedPaths = lib.mkOption {
      type = lib.types.listOf lib.types.str;
      default = [
        "/home/player00/NixOS"
        "/tmp"
      ];
      description = "Filesystem paths accessible to the agent";
    };
    
    enableGithub = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = "Enable GitHub integration";
    };
    
    enablePlaywright = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = "Enable Playwright browser automation";
    };
  };

  config = lib.mkIf config.claude-code-agent.enable {
    # Create agent-specific MCP configuration
    system.build.claudeCodeMcp = 
      let
        baseConfig = {
          filesystem = {
            enable = true;
            args = config.claude-code-agent.allowedPaths;
          };
          fetch = {
            enable = true;
            env = {
              USER_AGENT = "Claude-Code/1.0";
              TIMEOUT = "30000";
            };
          };
          sequential-thinking = {
            enable = true;
            env = {
              SEQUENTIAL_THINKING_MODE = "advanced";
              MAX_THINKING_STEPS = "50";
              ENABLE_REFLECTION = "true";
            };
          };
        };
        
        githubConfig = lib.optionalAttrs config.claude-code-agent.enableGithub {
          git = {
            enable = true;
          };
          github = {
            enable = true;
            passwordCommand = {
              GITHUB_PERSONAL_ACCESS_TOKEN = [ "gh" "auth" "token" ];
            };
          };
        };
        
        playwrightConfig = lib.optionalAttrs config.claude-code-agent.enablePlaywright {
          playwright = {
            enable = true;
            env = {
              PLAYWRIGHT_HEADLESS = true;
              PLAYWRIGHT_BROWSERS_PATH = "${pkgs.playwright-driver.browsers}";
            };
          };
        };
        
        profileConfigs = {
          basic = baseConfig;
          development = baseConfig // githubConfig // {
            memory = { enable = true; };
            sqlite = { enable = true; };
          };
          automation = baseConfig // playwrightConfig;
          full = baseConfig // githubConfig // playwrightConfig // {
            memory = { enable = true; };
            sqlite = { enable = true; };
          };
        };
      in
      mkMcpConfig (profileConfigs.${config.claude-code-agent.profile});

    # Install MCP configuration
    system.activationScripts.claude-code-mcp = ''
      mkdir -p /home/player00/.config/claude-code
      ln -sf ${config.system.build.claudeCodeMcp} /home/player00/.config/claude-code/mcp.json
      
      # Create convenience symlink in project root
      mkdir -p /home/player00/NixOS/.claude
      ln -sf ${config.system.build.claudeCodeMcp} /home/player00/NixOS/.claude/mcp.json
      
      chown -R player00:users /home/player00/.config/claude-code 2>/dev/null || true
    '';

    # Required packages for Claude Code agent
    environment.systemPackages = with pkgs; [
      # Core tools
      curl
      wget
      git
      gh
      
      # Node.js for MCP servers
      nodejs_22
      
      # Browser automation
    ] ++ lib.optionals config.claude-code-agent.enablePlaywright [
      playwright-driver
      chromium
      firefox
    ];

    # Environment variables for agent
    environment.variables = {
      CLAUDE_CODE_MCP_CONFIG = "/home/player00/.config/claude-code/mcp.json";
      MCP_SERVERS_PATH = "/etc/mcp-configs";
    };
  };
}