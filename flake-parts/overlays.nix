({
  config,
  lib,
  pkgs,
  inputs,
  system,
  self',
  ...
}: {
  nixpkgs.overlays = [
    # NUR overlay
    inputs.nur.overlays.default

    # Stable channel overlay
    (final: prev: {
      stable = import inputs.nixpkgs-stable {
        inherit system;
        config.allowUnfree = true;
      };
    })

    # Machine-specific package selection overlay
    (final: prev: {
      # Theme-based package selection logic
      sddm-astronaut =
        if config.settings.sddmTheme == "astronaut"
        then final.self.packages.${final.system}.sddm-astronaut-default
        else if config.settings.sddmTheme == "black_hole"
        then final.self.packages.${final.system}.sddm-astronaut-black-hole
        else if config.settings.sddmTheme == "purple_leaves"
        then final.self.packages.${final.system}.sddm-astronaut-purple-leaves
        else if config.settings.sddmTheme == "jake_the_dog"
        then final.self.packages.${final.system}.sddm-astronaut-jake-the-dog
        else if config.settings.sddmTheme == "hyprland_kath"
        then final.self.packages.${final.system}.sddm-astronaut-hyprland-kath
        else final.self.packages.${final.system}.sddm-astronaut-default; # fallback

      # Additional machine-specific package selections can follow same pattern
      # themed-wallpaper = selectWallpaperVariant settings.wallpaper;
    })
  ];
})
