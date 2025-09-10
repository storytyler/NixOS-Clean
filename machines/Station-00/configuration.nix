{ lib, config, pkgs, inputs, self, videoDriver, hostname, browser, editor, terminal, terminalFileManager, machineConfig, kbdLayout, kbdVariant, ... }:

{

  imports = [
    ./hardware-configuration.nix
    ../../modules/profiles/workstation.nix
    ../../flake-parts/machines.nix

  ];

  # Machine-specific overrides
  networking.hostName = "Station-00";  # Override default from machineConfig
  
  # Enable zsh system-wide (required for user shell)
  programs.zsh.enable = true;
  
  # Boot loader override - use systemd-boot instead of GRUB for this machine
  boot.loader = {
    grub.enable = lib.mkForce false;
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };
  
  # Docker configuration - hybrid approach
  virtualisation.docker = {
    enable = true;
    enableOnBoot = true;
    # No GPU support needed for database containers
    enableNvidia = false;
    # Enable rootless mode for additional security
    rootless = {
      enable = true;
      setSocketVariable = true;
    };
  };
  
  # Add user to docker group for admin access when needed
  users.users.player00.extraGroups = [ "docker" ];

  users.users.player00.subUidRanges = [
    { startUid = 100000; count = 65536; }
  ];
  users.users.player00.subGidRanges = [
    { startGid = 100000; count = 65536; }
  ];
  
  # Enable podman as alternative for agent workloads
  virtualisation.podman = {
    enable = true;
    # dockerCompat disabled to avoid conflict with Docker
    dockerCompat = false;
    defaultNetwork.settings.dns_enabled = true;
  };

  # Machine-specific system packages
  environment.systemPackages = with pkgs; [
    nodejs_24 # Includes npm
    docker-compose # For multi-container orchestration
    inputs.nix-ai-tools.packages.${pkgs.system}.claude-desktop # Claude Desktop for workflow management
    
    # Speech-to-Text
    whisper-cpp # CPU-optimized Whisper implementation
    ffmpeg # Audio processing for STT pipeline
    
    # AI Memory System
    python3 # Python runtime
    (python3.withPackages (ps: with ps; [
      chromadb # Local vector database
      sentence-transformers # Embedding models including Gemma 3 Embed
      numpy # Numerical computing
      torch # PyTorch for model inference
    ]))
  ];
  
  # Home Manager configuration
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