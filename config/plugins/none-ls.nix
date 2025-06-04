{
  programs.nixvim.plugins.none-ls = {
    enable = true;

    # formatters
    sources.formatting = {
      alejandra.enable = true; # Nix
    };
  };
}
