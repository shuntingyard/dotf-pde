{ pkgs, ... }: {
  plugins = {
    treesitter = {
      enable = true;

      nixvimInjections = true;

      # Presumably exist in unstable.
      settings = {
        highlight.enable = true;
        indent.enable = true;
      };
      folding = false;

      # Limit grammars installed.
      grammarPackages = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
        bash
        json
        lua
        make
        markdown
        nix
        regex
        toml
        vim
        vimdoc
        xml
        yaml
      ];
    };

    treesitter-refactor = {
      enable = true;
      highlightDefinitions = {
        enable = true;
        # Set to false if you have an `updatetime` of ~100.
        clearOnCursorMove = true;
      };
    };

    hmts.enable = true;
  };
}
