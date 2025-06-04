{
  imports = [
    # ./barbar.nix
    ./cmp.nix # This is a collection of plugins.
    # ./efm.nix
    # ./floaterm.nix
    # ./harpoon.nix
    ./lsp.nix
    ./lualine.nix
    # ./markdown-preview.nix
    # ./neorg.nix
    # ./neo-tree.nix
    #./none-ls.nix
    ./startify.nix
    ./sleuth.nix
    # ./tagbar.nix
    ./telescope.nix
    ./treesitter.nix
    # ./vimtex.nix
    ./which-key.nix
  ];

  # simple configs right here
  plugins = {
    gitsigns = {
      enable = true;
      settings.signs = {
        add.text = "+";
        change.text = "~";
      };
    };

    comment.enable = true; # gc - toggle line comment, gb - toggle block comment
    fidget.enable = true; # Progress spinner LSP
    lsp-lines.enable = true; # Render diagnostics as virtual lines.
    nvim-autopairs.enable = true; # () {} []

    colorizer = {
      enable = true;
      settings.user_default_options.names = false;
    };

    oil.enable = true;

    trim = {
      enable = true;
      settings = {
        highlight = true;
        ft_blocklist = [
          "checkhealth"
          "floaterm"
          "lspinfo"
          "neo-tree"
          "TelescopePrompt"
        ];
      };
    };
  };
}
