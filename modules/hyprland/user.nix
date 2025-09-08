{
  config,
  lib,
  pkgs,
  ... 
}: {
  # User-level Hyprland configuration
  # Handles window manager settings, keybinds, plugins, and user preferences
  
  wayland.windowManager.hyprland = {
    enable = true;
    
    # 🌈 FLASHY CYBERPUNK PLUGINS 🌈
    # Note: Plugins are configured at system level via home-manager.sharedModules
    # This prevents system vs home-manager conflicts
    
    systemd = {
      enable = true;
      variables = ["--all"];
    };
    
    settings = {
      "$mainMod" = "SUPER";
      "$term" = "alacritty";
      "$editor" = "code --disable-gpu";
      "$fileManager" = "$term --class \"terminalFileManager\" -e yazi";
      "$browser" = "zen";

      env = [
        "XDG_CURRENT_DESKTOP,Hyprland"
        "XDG_SESSION_DESKTOP,Hyprland"
        "XDG_SESSION_TYPE,wayland"
        "GDK_BACKEND,wayland,x11,*"
        "NIXOS_OZONE_WL,1"
        "ELECTRON_OZONE_PLATFORM_HINT,auto"
        "MOZ_ENABLE_WAYLAND,1"
        "OZONE_PLATFORM,wayland"
        "EGL_PLATFORM,wayland"
        "CLUTTER_BACKEND,wayland"
        "SDL_VIDEODRIVER,wayland"
        "QT_QPA_PLATFORM,wayland;xcb"
        "QT_WAYLAND_DISABLE_WINDOWDECORATION,1"
        "QT_QPA_PLATFORMTHEME,qt6ct"
        "QT_AUTO_SCREEN_SCALE_FACTOR,1"
        "WLR_RENDERER_ALLOW_SOFTWARE,1"
        "NIXPKGS_ALLOW_UNFREE,1"
      ];

      # Monitor configuration - LG TV left, Dell monitor right, bottom-aligned
      monitor = [
        "HDMI-A-2,3840x2160@30,0x0,1"        # LG TV at origin (left)
        "HDMI-A-1,1920x1080@60,3840x1080,1"  # Dell monitor right, offset down 1080px for bottom alignment
      ];

      exec-once = [
        # Add any autostart applications here
      ];

      # 🎨 Window appearance (colors managed by Stylix)
      general = {
        gaps_in = 5;
        gaps_out = 20;
        border_size = 2;
        "col.active_border" = lib.mkForce "rgba(ca9ee6ff) rgba(f2d5cfff) 45deg";
        "col.inactive_border" = lib.mkForce "rgba(b4befecc) rgba(6c7086cc) 45deg";
      };

      # 🌟 PLUGIN CONFIGURATIONS 🌟
      # NOTE: Plugin configurations disabled until plugins are compatible with current Hyprland
      
      # hyprexpo: Workspace overview (DISABLED - command not working)
      # "plugin:hyprexpo" = {
      #   columns = 3;                 # 3x3 workspace grid
      #   gap_size = 8;               # Spacing between workspace previews
      #   bg_col = "rgba(11111bee)";   # Dark background
      #   workspace_method = "center current"; # Focus current workspace
      #   
      #   # Keybind for overview (Super+Tab)
      #   enable_gesture = true;       # Trackpad gesture support
      # };

      # borders-plus-plus: RGB glowing borders
      "plugin:borders-plus-plus" = {
        add_borders = 1;              # Single border layer to test
        "col.border_1" = "rgba(ff6ec7ee) rgba(89dcebee) 45deg";  # Hot pink to cyan gradient
        border_size_1 = 2;           # Moderate thickness
        natural_rounding = "yes";     # Smooth corners
      };

      # hyprwinwrap: For animated wallpapers later (DISABLED)
      # "plugin:hyprwinwrap" = {
      #   # Will be configured for animated wallpapers
      # };

      layerrule = [
        "blur, rofi"
        "ignorezero, rofi"
        "ignorealpha 0.7, rofi"

        "blur, swaync-control-center"
        "blur, swaync-notification-window"
        "ignorezero, swaync-control-center"
        "ignorezero, swaync-notification-window"
        "ignorealpha 0.7, swaync-control-center"
      ];

      # 🚀 ENHANCED CYBERPUNK ANIMATIONS 🚀
      animations = {
        enabled = false;
        bezier = [
          "linear, 0, 0, 1, 1"
          "md3_standard, 0.2, 0, 0, 1"
          "md3_decel, 0.05, 0.7, 0.1, 1"
          "md3_accel, 0.3, 0, 0.8, 0.15"
          "overshot, 0.05, 0.9, 0.1, 1.1"
          "crazyshot, 0.1, 1.5, 0.76, 0.92"
          "hyprnostretch, 0.05, 0.9, 0.1, 1.0"
          "fluent_decel, 0.1, 1, 0, 1"
          "easeInOutCirc, 0.85, 0, 0.15, 1"
          "easeOutCirc, 0, 0.55, 0.45, 1"
          "easeOutExpo, 0.16, 1, 0.3, 1"
        ];
        animation = [
          # 🚀 ENHANCED CYBERPUNK ANIMATIONS 🚀
          "windows, 1, 4, crazyshot, popin 80%"
          "border, 1, 15, easeOutCirc"
          "borderangle, 1, 8, easeInOutCirc, loop"
          "fade, 1, 3, md3_decel"
          "workspaces, 1, 6, easeOutExpo, slidefade 20%"
          "specialWorkspace, 1, 4, overshot, slidevert"
          
          # Layer animations for that extra glow
          "layers, 1, 2, easeOutCirc, slide"
        ];
      };

      rendering = {
        # direct_scanout = 2; # 0 = off, 1 = on, 2 = auto (on with content type 'game')
      };

      misc = {
        disable_hyprland_logo = true;
        mouse_move_focuses_monitor = true;
        swallow_regex = "^(Alacritty|kitty)$";
        enable_swallow = true;
        vfr = true; # always keep on
        # vrr = 1; # enable variable refresh rate (0=off, 1=on, 2=fullscreen only)
        # Removed deprecated donation/news settings - they may not exist in current Hyprland
      };

      gestures = {
        workspace_swipe = "on";
        workspace_swipe_fingers = 3;
        workspace_swipe_invert = "no";
        workspace_swipe_distance = 200;
        workspace_swipe_forever = "yes";
      };

      # 🔥 CYBERPUNK KEYBINDS 🔥
      bind = [
        # Essential window management
        "$mainMod, C, killactive,"
        "$mainMod, M, exit,"
        "$mainMod, E, exec, $fileManager"
        "$mainMod, V, togglefloating,"
        "$mainMod, D, exec, rofi -show drun"
        "$mainMod, P, pseudo, # dwindle"
        "$mainMod, J, togglesplit, # dwindle"

        # Applications
        "$mainMod, T, exec, $term"
        "$mainMod, B, exec, $browser"
        
        # Plugin keybinds
        # "$mainMod, Tab, hyprexpo:expo, toggle" # Workspace overview - disabled
        
        # Screenshots
        ", Print, exec, grimblast copy area"
        "$mainMod, Print, exec, grimblast copy screen"
        
        # Audio
        ", XF86AudioRaiseVolume, exec, pamixer -i 5"
        ", XF86AudioLowerVolume, exec, pamixer -d 5"
        ", XF86AudioMute, exec, pamixer -t"
        
        # Brightness
        ", XF86MonBrightnessUp, exec, brightnessctl set +5%"
        ", XF86MonBrightnessDown, exec, brightnessctl set 5%-"

        # Move focus with mainMod + arrow keys
        "$mainMod, left, movefocus, l"
        "$mainMod, right, movefocus, r"
        "$mainMod, up, movefocus, u"
        "$mainMod, down, movefocus, d"

        # Switch workspaces with mainMod + [0-9]
        "$mainMod, 1, workspace, 1"
        "$mainMod, 2, workspace, 2"
        "$mainMod, 3, workspace, 3"
        "$mainMod, 4, workspace, 4"
        "$mainMod, 5, workspace, 5"
        "$mainMod, 6, workspace, 6"
        "$mainMod, 7, workspace, 7"
        "$mainMod, 8, workspace, 8"
        "$mainMod, 9, workspace, 9"
        "$mainMod, 0, workspace, 10"

        # Move active window to a workspace with mainMod + SHIFT + [0-9]
        "$mainMod SHIFT, 1, movetoworkspace, 1"
        "$mainMod SHIFT, 2, movetoworkspace, 2"
        "$mainMod SHIFT, 3, movetoworkspace, 3"
        "$mainMod SHIFT, 4, movetoworkspace, 4"
        "$mainMod SHIFT, 5, movetoworkspace, 5"
        "$mainMod SHIFT, 6, movetoworkspace, 6"
        "$mainMod SHIFT, 7, movetoworkspace, 7"
        "$mainMod SHIFT, 8, movetoworkspace, 8"
        "$mainMod SHIFT, 9, movetoworkspace, 9"
        "$mainMod SHIFT, 0, movetoworkspace, 10"

        # Special workspace (scratchpad)
        "$mainMod, S, togglespecialworkspace, magic"
        "$mainMod SHIFT, S, movetoworkspace, special:magic"

        # Scroll through existing workspaces with mainMod + scroll
        "$mainMod, mouse_down, workspace, e+1"
        "$mainMod, mouse_up, workspace, e-1"
        
        # Plugin keybinds (disabled until plugins work)
        # "$mainMod, Tab, hyprexpo:expo, toggle" # Overview
      ];

      # Mouse bindings
      bindm = [
        "$mainMod, mouse:272, movewindow"
        "$mainMod, mouse:273, resizewindow"
      ];
    };
  };
}