# Snapshot file
# Unset all aliases to avoid conflicts with functions
unalias -a 2>/dev/null || true
# Check for rg availability
if ! command -v rg >/dev/null 2>&1; then
  alias rg='/nix/store/mj1jvd9cf412zfqzm35ngig0wikqn5vy-claude-code-1.0.92/lib/node_modules/\@anthropic-ai/claude-code/vendor/ripgrep/x64-linux/rg'
fi
export PATH=/tmp/tmp.9fLmWo4ujt\:/nix/store/fbxrl6107cma37gjw00l7dlv1wj4yjfz-glib-2.84.3-bin/bin\:/run/wrappers/bin\:/home/player00/.local/share/flatpak/exports/bin\:/var/lib/flatpak/exports/bin\:/home/player00/.nix-profile/bin\:/nix/profile/bin\:/home/player00/.local/state/nix/profile/bin\:/etc/profiles/per-user/player00/bin\:/nix/var/nix/profiles/default/bin\:/run/current-system/sw/bin\:/nix/store/lv91pnk6dqvw0xmbi5irli7m6nikfr33-binutils-wrapper-2.44/bin\:/nix/store/4wgr4waq5xxk94vgc8lyyhsp7l59jprp-hyprland-qtutils-0.1.4/bin\:/nix/store/5h5758kspk2ir12dvwrgilmcizz617kh-pciutils-3.14.0/bin\:/nix/store/43vw43b1km56y6idkzrbz5narkhlfca4-pkgconf-wrapper-2.4.3/bin
