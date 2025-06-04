{
  lib,
  pkgs,
  ...
}:
{
  # basic layer from my old PDE

  globals = {
    # Disable useless providers - nice thing - new for me!
    loaded_ruby_provider = 0; # Ruby
    loaded_perl_provider = 0; # Perl
    loaded_python_provider = 0; # Python 2
  };

  clipboard = {
    # Use system clipboard
    register = "unnamedplus";

    providers.wl-copy.enable = true; # TODO qu'est-ce que c'est?
  };

  extraPlugins = [
    pkgs.vimPlugins.sonokai
  ];
  colorscheme = lib.mkDefault "sonokai";

  opts = {
    updatetime = 250; # Faster completion
    timeoutlen = 500; # Decrease time to enter a keymap sequence.

    # Don't show the mode, since it's already in the statusline.
    showmode = false;

    # Color, UI
    background = "dark";
    termguicolors = true;
    signcolumn = "yes";

    # Search
    ignorecase = true;
    smartcase = true;
    hlsearch = true;
    incsearch = true;

    # Scrolling, wrapping
    scrolloff = 1;
    sidescroll = 1;
    sidescrolloff = 2;
    breakindent = true; # Nicer when wrapping is on.

    # Numbers, cursor
    number = true;
    relativenumber = true;
    cursorline = true;

    # Completion
    completeopt = "menu,menuone,preview,noselect";

    mouse = "a"; # Enable mouse control.
    mousemodel = "extend"; # Mouse right-click extends the current selection.

    # Save undo history.
    undofile = true;

    # Configure how new splits should be opened.
    splitright = true;
    splitbelow = true;
  };
}
