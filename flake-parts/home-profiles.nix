{
  pkgs,
  lib,
  inputs,
  unstablePkgs,
  config,
  ...
}: {
  # Import all the Home Manager configurations that Station-00's modules expect
  imports = [
    # Main Hyprland user config with keybinds and plugins
    ../modules/hyprland/user.nix
    
    # environment configs
    ../modules/hyprland/programs/dunst/home.nix
    ../modules/hyprland/programs/rofi/home.nix
    ../modules/hyprland/programs/waybar/home.nix
    ../modules/hyprland/programs/swaync/home.nix
    ../modules/hyprland/programs/wlogout/home.nix
    ../modules/hyprland/programs/hyprlock/home.nix
    ../modules/hyprland/programs/hypridle/home.nix
    ../modules/hyprland/programs/swaylock/home.nix

    # CLI tool configs
    ../modules/programs/cli/starship/home.nix
    ../modules/programs/cli/tmux/home.nix
    ../modules/programs/cli/direnv/home.nix  
    ../modules/programs/cli/lazygit/home.nix
    ../modules/programs/cli/cava/home.nix
    ../modules/programs/cli/btop/home.nix
    ../modules/programs/cli/yazi/home.nix
    
    # Terminal
    ../modules/programs/terminal/alacritty/home.nix

    # Media app configs
    ../modules/programs/media/discord/home.nix
    ../modules/programs/media/obs-studio/home.nix

    
    # Shell configuration
    ../modules/programs/shell/zsh/home.nix
  ];

  # Define your Home Manager state version
  home.stateVersion = "24.05";

  # User-specific packages
  home.packages = with pkgs; [
    gemini-cli
    claude-code
    qwen-code
    git
    htop
    neofetch
  ];

}
