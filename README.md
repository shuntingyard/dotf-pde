# dotf-pde

Neovim personalized development environment

## Conventions

- `personalized.nvim.hm` for nixvim's homeModules
- `personalized.nvim.nixos` for nixvim's nixosModules (implementation pending!)
- `personalized.nvim.darwin` for nixvim's nixDarwinModules (implementation pending!)

## TODO List

- [x] Test integration of this standalone nixvim configuration with your main flake.
- [x] Do scaffolding for a home-manager module
- [ ] Assert LSP `nixd` has optimal configuration.
- [ ] Fix error encountered when opening `lualine.nix`.
    (`luaLoader.enable=false;` doesn't fix!)
- [ ] Check/integrate plugins yet commented out.

## Notes on Code commented out

- As imported from old configuration: `# option`
- Very recently commented: `#option`
