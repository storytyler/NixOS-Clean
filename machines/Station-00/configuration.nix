{ lib, config, pkgs, inputs, self, videoDriver, hostname, browser, editor, terminal, terminalFileManager, machineConfig, kbdLayout, kbdVariant, ... }:

{

  imports = [
    ./hardware-configuration.nix
    ../../modules/profiles/workstation.nix
    ../../modules/services/mcp
  ];

  # Critical system services
  networking.networkmanager.enable = true;
  networking.hostName = "Station-00";

   
  # Enable essential services
  services.openssh.enable = true;
  services.dbus.enable = true;
  
  # MCP (Model Context Protocol) services for AI agents
  services.mcp = {
    enable = true;
    profile = "development";           # Enable development-level MCP servers
    enableClaudeCode = true;           # Enable Claude Code agent configuration
    claudeCodeProfile = "development"; # Use development profile for Claude Code
  };
  
  # Enable zsh system-wide (required for user shell)
  programs.zsh.enable = true;
  
  # Boot loader configuration (UEFI)
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  
  # User configuration
  users.users.player00 = {
    isNormalUser = true;
    group = "player00";
    extraGroups = [ "wheel" "networkmanager" "video" "audio" ];
    shell = pkgs.zsh;
  };
  # System packages
  environment.systemPackages = with pkgs; [
    nodejs_24 # Includes npm
  ];
  users.groups.player00 = {};
  
  # System configuration
  system.stateVersion = "24.05"; # Don't change this unless you know what you're doing
  
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
  
  # Enable experimental Nix features (required by Home Manager)
  nix.settings.experimental-features = [ "nix-command" "flakes" ];


  home-manager.useUserPackages = true;

  # Agenix secrets management - DISABLED (agenix module not imported)
  # age.identityPaths = [ ../../secrets/agenix_host_key ];

  # Agenix secrets
  

  # Agenix secrets (temporarily disabled gemini-cli-auth due to decryption issues)
  # age.secrets.gemini-cli-auth = {
  #   file = ../../secrets/gemini-api-key.age;
  #   mode = "0400";
  #   owner = "root";
  # };

}