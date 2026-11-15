{ pkgs, ... }: {
  imports = [
    ./keymappings.nix
    ./options.nix
    ./plugins
    ./temp-fixes
  ];

  luaLoader.enable = true;

  extraPackages = with pkgs; [
    # Binaries to support the bashls LSP server
    shellcheck
    shfmt

    # Formatting for nixd
    alejandra

    # Official nu formatter binary
    topiary
  ];
}
