# Snapshot file
# Unset all aliases to avoid conflicts with functions
unalias -a 2>/dev/null || true
# Functions
# Shell Options
setopt nohashdirs
setopt login
# Aliases
alias -- run-help=man
alias -- which-command=whence
# Check for rg availability
if ! command -v rg >/dev/null 2>&1; then
  alias rg='/nix/store/2iwjzgjzf622h860sr4039yk9s22l2s7-claude-code-1.0.92/lib/node_modules/\@anthropic-ai/claude-code/vendor/ripgrep/x64-linux/rg'
fi
export PATH=/run/wrappers/bin\:/home/player00/.local/share/flatpak/exports/bin\:/var/lib/flatpak/exports/bin\:/home/player00/.nix-profile/bin\:/nix/profile/bin\:/home/player00/.local/state/nix/profile/bin\:/etc/profiles/per-user/player00/bin\:/nix/var/nix/profiles/default/bin\:/run/current-system/sw/bin\:/nix/store/ky2x48xfid0nn5arablpwlnsngj70gws-binutils-wrapper-2.44/bin\:/nix/store/jlgm3d296k50w4nar645d3zch8xs332s-hyprland-qtutils-0.1.4/bin\:/nix/store/83clm3iscfyi4prrar8rbandrmss5sfd-pciutils-3.14.0/bin\:/nix/store/b6wz03kpkjvn6accwhnw6k6qki628dnx-pkgconf-wrapper-2.4.3/bin
