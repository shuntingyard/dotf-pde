{
  imports = [
    ./keymappings.nix
    ./options.nix
    ./plugins
    ./temp-fixes
  ];

  luaLoader.enable = true;
}
