{config, lib, pkgs, ...}: {

      programs.wezterm = {
        enable = true;
        # package = inputs.self.packages.${pkgs.system}.wezterm;
        extraConfig = ''
          local wezterm = require ("wezterm")

          local function font_with_fallback(name, params)
            local names = { name, "Material Symbols Outlined"}
            return wezterm.font_with_fallback(names, params)
          end

          local font_name = "JetBrainsMono Nerd Font"

          return {
            font_size = 12.0,

           -- Font config
            font = font_with_fallback(font_name),
            font_rules = {
               {
                 italic = true,
                 font = font_with_fallback(font_name, { italic = true }),
               },
            },
            color_scheme = "Catppuccin Mocha",
            enable_tab_bar = true,
            hide_tab_bar_if_only_one_tab = true,
            window_padding = {
              left = 2,
              right = 2,
              top = 0,
              bottom = 0,
            },
            window_background_opacity = 0.9,
          }
        '';
      };
    }
