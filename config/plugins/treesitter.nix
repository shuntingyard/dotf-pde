{ pkgs, ... }: {
  plugins = {
    treesitter = {
      enable = true;

      # Control native Neovim features via Nixvim's FileType autocmds
      highlight.enable = true;
      indent.enable = true;
      folding.enable = false;

      # Limit grammars installed.
      grammarPackages = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
        bash
        c
        cpp
        json
        lua
        make
        markdown
        nix
        nu
        regex
        rust
        toml
        vim
        vimdoc
        xml
        yaml
      ];
    };

    /*
      What hmts.nvim Does

      When writing Nix and Home Manager configurations, you frequently embed snippets
      of other languages inside multiline strings ('' ... ''), such as Lua configs,
      Bash scripts, or TOML settings. By default, Neovim highlights those blocks as
      plain string text.

      • Syntax injection in Nix strings. hmts.nvim provides custom Treesitter queries that
        detect the target language from Home Manager options (like extraConfigLua or
        initExtra) and inject proper syntax highlighting.
      • Shebang detection. It automatically highlights inline scripts that start with a
        shebang (such as #!/bin/bash or #!/usr/bin/env python).
    */
    hmts.enable = true;

    /*
      While hmts.nvim handles Home Manager options, nixvimInjections handles
      Nixvim-specific module options so your inline Lua and Vimscript snippets aren't
      displayed as plain strings.
    */
    treesitter.nixvimInjections = true;
  };
}
