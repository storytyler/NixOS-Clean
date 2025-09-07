{
  config,
  lib,
  pkgs,
  ...
}: {
  programs.alacritty = let
    inherit (lib) getExe;
  in {
    enable = true;
    settings = {
      # Colors handled by Stylix - removed to avoid conflicts

      # Fonts also handled by Stylix - removed to avoid conflicts

      window = {
        decorations = "full";
        dynamic_padding = false;
        opacity = lib.mkForce 0.6;  # Override Stylix for cyberpunk transparency
        startup_mode = "Maximized";

        padding.x = 0;
        padding.y = 0;
        dimensions.columns = 100;
        dimensions.lines = 30;
        class.general = "Alacritty";
        class.instance = "Alacritty";
      };

      terminal.shell = {
        program = "${getExe pkgs.zsh}";
      };

      keyboard.bindings = [
        {
          chars = "cd $(${getExe pkgs.fd} . /mnt/work /mnt/work/dev/ /run /run/current-system ~/.local/ ~/ --max-depth 2 | fzf)\r";
          key = "F";
          mods = "Control";
        }
        {
          chars = "tmux-sessionizer\r";
          key = "T";
          mods = "Control";
        }
        {
          action = "Paste";
          key = "Y";
          mods = "Control";
        }
        {
          action = "Copy";
          key = "W";
          mods = "Alt";
        }
        {
          action = "SpawnNewInstance";
          key = "Return";
          mods = "Super|Shift";
        }
      ];

      selection = {
        save_to_clipboard = false;
        semantic_escape_chars = ",│`|:\"' ()[]{}<>\t";
      };

      scrolling = {
        history = 10000;
        multiplier = 3;
      };
    };
  };
}
