# dotf-pde# pde-nixvim

Neovim Personalized Development Environment

## How to use

You can use this flake as an input:

```nix
{
    inputs = {
        nixvim.url = "github:shuntingyard/dotf-pde"
    };
}
```

You can then install the package either normally or through home-manager.

#### Normal:

```nix
environment.systemPackages = [
    inputs.nixvim.packages.x86_64-linux.default
];
```

#### Home-Manager

```nix
home-manager.users.<user>.home.packages = [
    inputs.nixvim.packages.x86_64-linux.default
];
```

## TODO List

- [x] test integration of this standalone nixvim config with main flake.
- [ ] assert LSP `nixd` has optimal configuration (or even use Rust-based LSP
    again).
- [x] fix error encountered when opening `lualine.nix`.
- [ ] check/integrate plugins yet commented out.

## Notes on Code commented out

- as imported from old config: `# option`
- very recently commented: `#option`
