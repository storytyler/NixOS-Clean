# MCP Services Module
# Integrates MCP (Model Context Protocol) services into the NixOS system

{ lib, config, pkgs, inputs, ... }:

let
  cfg = config.services.mcp;
  mcp-servers-nix = inputs.mcp-servers-nix;
  
  # Create MCP configuration using mcp-servers-nix
  mkMcpConfig = serverConfig: mcp-servers-nix.lib.mkConfig pkgs {
    flavor = "claude";
    programs = serverConfig;
  };

  # Define server configurations based on profile
  getServerConfig = profile: {
    basic = {
      sequential-thinking = { enable = true; };
    };
    development = {
      playwright = {
        enable = true;
        args = [ "--executable-path" "${inputs.zen-browser.packages.${pkgs.system}.default}/bin/zen" ];
        env = {
          PLAYWRIGHT_HEADLESS = true;
        };
      };
      sequential-thinking = {
        enable = true;
        env = {
          SEQUENTIAL_THINKING_MODE = "advanced";
          MAX_THINKING_STEPS = "50";
        };
      };
      memory = { enable = true; };
    };
    full = {
      # filesystem = { enable = true; args = [ "/home/player00" "/tmp" ]; };  # Native filesystem access available
      # fetch = { enable = true; };                                          # Native web fetch available
      playwright = { 
        enable = true;
        args = [ "--executable-path" "${inputs.zen-browser.packages.${pkgs.system}.default}/bin/zen" ];
        env = {
          PLAYWRIGHT_HEADLESS = true;
        };
      };
      sequential-thinking = { enable = true; };
      git = { enable = true; };
      github = { enable = true; };
      memory = { enable = true; };
      # sqlite = { enable = true; };  # Removed due to upstream archive
    };
  }.${profile};
in
{

  options.services.mcp = {
    enable = lib.mkEnableOption "MCP (Model Context Protocol) services";
    
    profile = lib.mkOption {
      type = lib.types.enum [ "basic" "development" "full" ];
      default = "development";
      description = "MCP services profile to enable";
    };
    
    enableClaudeCode = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = "Enable Claude Code agent MCP configuration";
    };
    
    claudeCodeProfile = lib.mkOption {
      type = lib.types.enum [ "basic" "development" "full" ];
      default = "development";
      description = "Claude Code agent profile";
    };
  };

  config = lib.mkIf cfg.enable {
    # Generate MCP configurations
    system.build.mcpConfigs = let
      serverConfig = getServerConfig cfg.profile;
      claudeServerConfig = getServerConfig cfg.claudeCodeProfile;
    in {
      system = mkMcpConfig serverConfig;
      claudeCode = mkMcpConfig claudeServerConfig;
    };

    # Install MCP configurations safely with proper dependencies
    system.activationScripts.mcp-setup = {
      text = ''
        # Create system-level MCP configuration directory
        mkdir -p /etc/mcp-configs
        
        # Install system configurations (safe - no user dependencies)
        ${lib.optionalString cfg.enable ''
          ln -sf ${config.system.build.mcpConfigs.system} /etc/mcp-configs/${cfg.profile}.json
        ''}
      '';
      deps = [ "users" "groups" ];  # Ensure users/groups exist first
    };

    # Handle user configurations via systemd service (runs after login)
    systemd.services.mcp-user-setup = lib.mkIf cfg.enableClaudeCode {
      description = "Setup MCP user configurations";
      wantedBy = [ "multi-user.target" ];
      after = [ "local-fs.target" ];
      serviceConfig = {
        Type = "oneshot";
        User = "player00";
        Group = "users";
        RemainAfterExit = true;
      };
      script = ''
        # Create user MCP configuration directories (safe - runs as user)
        mkdir -p $HOME/.config/claude-code
        mkdir -p $HOME/NixOS/.claude
        
        # Install user configurations
        ln -sf ${config.system.build.mcpConfigs.claudeCode} $HOME/.config/claude-code/mcp.json
        ln -sf ${config.system.build.mcpConfigs.claudeCode} $HOME/NixOS/.claude/mcp.json
      '';
    };

    # Required packages for MCP servers
    environment.systemPackages = with pkgs; [
      # Core tools
      curl
      wget
      git
      gh
      jq
      
      # Node.js for MCP servers
      nodejs_22
    ] ++ lib.optionals (cfg.profile == "development" || cfg.profile == "full") [
      # Browser automation (only for development/full profiles)
      playwright-driver
      chromium
      firefox
    ];

    # Environment setup for MCP
    environment.variables = {
      MCP_CONFIG_DIR = "/etc/mcp-configs";
      CLAUDE_CODE_CONFIG_DIR = "/home/player00/.config/claude-code";
    };

    # Add helpful shell aliases for MCP management
    programs.zsh.shellAliases = {
      mcp-status = "ls -la /etc/mcp-configs/";
      mcp-claude = "cat /home/player00/.config/claude-code/mcp.json | ${pkgs.jq}/bin/jq";
      mcp-logs = "journalctl -f | grep -i mcp";
    };
  };
}