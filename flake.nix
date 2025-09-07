{
  description = "Multi-machine NixOS configuration with modular architecture";

  inputs = {
    # Core inputs
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-25.05";

    # Flake utilities for better organization
    flake-parts.url = "github:hercules-ci/flake-parts";

    # Home Manager
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    
    # Stylix for automated theming
    stylix = {
      url = "github:danth/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    
    # Hyprland window manager
    hyprland = {
      url = "github:hyprwm/Hyprland";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    
    # Hyprland plugins (follows Hyprland for version consistency)
    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs.hyprland.follows = "hyprland";
    };
    
    # Claude Code
    claude-code = {
      url = "github:sadjow/claude-code-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Additional tools
    nix-index-database = {
      url = "github:nix-community/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim = {
      url = "github:Sly-Harvey/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nur.url = "github:nix-community/NUR";

    # Agenix for secrets management
   # agenix = {
    #  url = "github:ryantm/agenix";
    #  inputs.nixpkgs.follows = "nixpkgs";
    #  };

    betterfox = {
      url = "github:yokoffing/Betterfox";
      flake = false;
    };

    thunderbird-catppuccin = {
      url = "github:catppuccin/thunderbird";
      flake = false;
    };

    zen-browser = {
      url = "github:maximoffua/zen-browser.nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nvchad4nix = {
      url = "github:nix-community/nix4nvchad";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Development tools
    devenv = {
      url = "github:cachix/devenv";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Automated quality checks for configuration files
    pre-commit-hooks = {
      url = "github:cachix/pre-commit-hooks.nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # High-performance nix-shell replacement with caching
    nix-direnv = {
      url = "github:nix-community/nix-direnv";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Advanced Nix language server for development
    nixd = {
      url = "github:nix-community/nixd";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # MCP Servers Framework
    mcp-servers-nix = {
      url = "github:natsukium/mcp-servers-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # AI tools collection
    nix-ai-tools = {
      url = "github:numtide/nix-ai-tools";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # AI Help
    nix-ai = {
      url = "github:olafkfreund/nix-ai-help";
    };

    # Gemini CLI (latest from GitHub)
    gemini-cli-src = {
      url = "github:google-gemini/gemini-cli";
      flake = false;
    };

    };

  outputs =
    inputs@{
      self, # Add self back here
      nixpkgs,
      nixpkgs-stable,
      home-manager,
      flake-parts,
      ...
    }:
    let
      system = "x86_64-linux"; # Assuming a single system for now, can be made dynamic later
      pkgs = nixpkgs-stable.legacyPackages.${system}; # Use nixpkgs-stable for stable packages
      unstablePkgs = nixpkgs.legacyPackages.${system}; # Use nixpkgs for unstable packages
    in
    {
      nixosConfigurations = {
        "Station-00" = nixpkgs.lib.nixosSystem {
          inherit system;
          specialArgs = {
            inherit inputs unstablePkgs;
            videoDriver = "intel"; # Provide a default video driver
            browser = "zen"; # Provide a default browser
            terminal = "alacritty"; # Provide a default terminal
            editor = "vscode"; # Provide a default editor
            terminalFileManager = "yazi"; # Provide a default terminal file manager
            machineConfig = {
              role = "desktop"; # Provide a default role for the machine
              username = "player00"; # Provide a default username
              timezone = "America/New_York"; # Provide a default timezone
              hostname = "station-00"; # Provide a default hostname
              locale = "en_US.UTF-8"; # Provide a default locale
              shell = "zsh"; # Provide a default shell
              consoleKeymap = "us"; # Provide a default console keymap
              editor = "vscode"; # Provide a default editor
              features = {
                virtualization = false;
                containers = false;
                development = false; # Disabled - scripts directory missing
                gaming = false;
                multimedia = true; # Enable flatpak and media tools
              };
              desktop = "hyprland"; # Provide a default desktop environment
            }; # Provide a default machine configuration
            kbdLayout = "us"; # Provide a default keyboard layout
            kbdVariant = ""; # Provide a default keyboard variant (empty for no variant)
            inherit self; # Pass the flake's self reference
            wallpaper = "basement"; # Provide a default wallpaper
          };
          modules = [
            ./machines/Station-00/configuration.nix
            #inputs.agenix.nixosModules.default
            # Import flake-parts modules directly here if needed, or keep them in configuration.nix
            # For now, let's assume configuration.nix handles most imports
            inputs.home-manager.nixosModules.home-manager
            inputs.stylix.nixosModules.stylix
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.player00 = import ./flake-parts/home-profiles.nix;
              home-manager.extraSpecialArgs = { inherit inputs; };
            }
           # inputs.agenix.nixosModules.default # Import agenix module
          ];
        };
      };

      # Expose homeManagerModules for direct import in nixosConfigurations
      # homeManagerModules.home-profiles = import ./flake-parts/home-profiles.nix;

      # Expose other flake-parts outputs if necessary
      # ...

      packages.${system}.default = self.nixosConfigurations."Station-00".config.system.build.toplevel;

      # Formatter for 'nix fmt'
      formatter.${system} = nixpkgs.legacyPackages.${system}.nixfmt-rfc-style;
    };
}
