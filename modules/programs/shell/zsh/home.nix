{
  config,
  lib,
  pkgs,
  ...
}: {
  # Zsh shell configuration
  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    enableCompletion = true;
    
    history = {
      size = 100000;
      path = lib.mkForce "${config.xdg.dataHome}/zsh/history";  # Override any conflicting paths
    };
    
    dotDir = "${config.xdg.configHome}/zsh";
    
    oh-my-zsh = {
      enable = true;
      plugins = [
        "git"
        "gitignore"
        "z"
      ];
    };
    
    initContent = ''
      # Powerlevel10k Zsh theme
      source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme
      test -f ~/.config/zsh/.p10k.zsh && source ~/.config/zsh/.p10k.zsh

      # Direnv hook
      eval "$(direnv hook zsh)"

      # Key Bindings
      bindkey '^l' "yazi\r"
      bindkey '^a' beginning-of-line
      bindkey '^e' end-of-line

      # Options
      unsetopt menu_complete
      unsetopt flowcontrol

      setopt prompt_subst
      setopt always_to_end
      setopt append_history
      setopt auto_menu
      setopt complete_in_word
      setopt extended_history
      setopt hist_expire_dups_first
      setopt hist_ignore_dups
      setopt hist_ignore_space
      setopt hist_verify
      setopt inc_append_history
      setopt share_history

      # Yazi file manager integration
      function yazi {
          tmp="$(mktemp -t "yazi-cwd.XXXXX")"
          command yazi "$@" --cwd-file="$tmp"
          if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
              cd -- "$cwd"
          fi
          rm -f -- "$tmp"
      }
    '';
  };

  # Copy p10k config and templates
  xdg.configFile."zsh/.p10k.zsh".source = ./.p10k.zsh;
  xdg.configFile."zsh/templates" = {
    source = ./templates;
    recursive = true;
  };
}