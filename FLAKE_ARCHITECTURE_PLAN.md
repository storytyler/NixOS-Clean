# NixOS Multi-Flake Architecture Plan

## Current State
- Single monolithic flake with mixed concerns
- Redundant configurations across machines
- Unused flake-parts infrastructure
- MCP ecosystem cleaned up

## Proposed Multi-Flake Structure

```
/home/player00/NixOS/
├── shared-modules/           # Core reusable modules
│   ├── flake.nix            # nixosModules.intel-base, .networking, etc.
│   ├── flake.lock
│   └── modules/
│       ├── hardware/intel/
│       ├── networking/
│       └── base-system/
│
├── packages/                # Custom packages & overlays
│   ├── flake.nix           # packages.x86_64-linux.my-app
│   ├── flake.lock          # overlays.custom
│   └── pkgs/
│
├── desktop-systems/         # Full desktop configs
│   ├── flake.nix           # nixosConfigurations.Station-00
│   ├── flake.lock          # inputs: shared-modules, user-environments
│   └── hosts/
│       └── Station-00/
│
├── minimal-systems/         # Laptop/server configs  
│   ├── flake.nix           # nixosConfigurations.Station-01/02
│   ├── flake.lock          # inputs: shared-modules
│   └── hosts/
│       ├── Station-01/
│       └── Station-02/
│
├── user-environments/       # Home Manager configs
│   ├── flake.nix           # homeConfigurations.player00-desktop/minimal
│   ├── flake.lock          # inputs: packages
│   └── profiles/
│       ├── desktop/        # Hyprland, GUI apps
│       └── minimal/        # CLI only
│
├── services/               # Service definitions  
│   ├── flake.nix          # nixosModules.mcp-servers, .monitoring
│   ├── flake.lock
│   └── modules/
│       ├── mcp/
│       ├── monitoring/
│       └── databases/
│
├── development/            # Dev environments
│   ├── flake.nix          # devShells.python, .rust, .nix
│   ├── flake.lock         # inputs: packages  
│   └── shells/
│
├── secrets/               # Secret management
│   ├── flake.nix         # Age keys, secret definitions
│   ├── flake.lock
│   └── keys/
│
└── deployment/           # Deployment automation
    ├── flake.nix        # Apps for deploy, backup, monitoring
    ├── flake.lock       # inputs: all system flakes
    └── scripts/
```

## Machine Requirements

### Station-00 (Desktop)
- Intel hardware
- Full Hyprland desktop environment
- Development tools
- Media applications
- Full user environment

### Station-01/02 (Laptops)  
- Intel hardware
- Minimal/headless potential
- Server-oriented packages
- Power management
- Minimal user environment

## Flake Dependencies

```
deployment → desktop-systems → shared-modules
          → minimal-systems → shared-modules  
          → user-environments → packages
          → services → shared-modules
          → secrets
          
development → packages
```

## Benefits

1. **No Redundancy** - Shared configs in shared-modules
2. **Clear Separation** - System vs User vs Services vs Development
3. **Independent Development** - Test packages without system rebuild
4. **Machine-Specific Optimization** - Desktop vs minimal configs
5. **Reusable Components** - Modules usable across different setups

## Usage Examples

```bash
# Deploy desktop
nix run deployment#deploy-desktop Station-00

# Develop with Python  
nix develop development#python

# Build custom package
nix build packages#my-app

# Switch minimal system
nixos-rebuild switch --flake minimal-systems#Station-01

# Switch desktop system
nixos-rebuild switch --flake desktop-systems#Station-00
```

## Migration Strategy

1. **Phase 1**: Extract shared-modules from current monolithic flake
2. **Phase 2**: Create desktop-systems flake for Station-00
3. **Phase 3**: Create minimal-systems flake for laptops  
4. **Phase 4**: Extract user-environments with Home Manager
5. **Phase 5**: Create services flake for MCP/other services
6. **Phase 6**: Add development environments and deployment automation

## Implementation Notes

- Each flake is completely independent
- No circular dependencies
- Clear ownership boundaries  
- Can implement incrementally
- Current setup continues working during migration

---

*This architecture addresses the current redundancy issues while providing clear separation of concerns and scalability for future additions.*