{
  imports = [
    ./keymappings.nix
    ./options.nix
    ./plugins
  ];

  luaLoader.enable = true;
}
