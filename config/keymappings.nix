{
  globals = {
    mapleader = " ";
    maplocalleader = " ";
  };

  keymaps = [
    #
    # teej_dv kickstarter keys
    #

    #
    # Primeagen
    #

    {
      mode = "v";
      key = "J";
      action = ":m '>+1<CR>gv=gv";
      options = {
        desc = "Visual selection down, respecting indents";
      };
    }
    {
      mode = "v";
      key = "K";
      action = ":m '<-2<CR>gv=gv";
      options = {
        desc = "Visual selection up, respecting indents";
      };
    }
    {
      mode = "n";
      key = "<C-d>";
      action = "<C-d>zz";
      options = {
        desc = "Half page down, keep cursor center";
      };
    }
    {
      mode = "n";
      key = "<C-u>";
      action = "<C-u>zz";
      options = {
        desc = "Half page up, keep cursor center";
      };
    }
    {
      mode = "n";
      key = "n";
      action = "nzzzv";
      options = {
        desc = "Search next down, keep cursor center";
      };
    }
    {
      mode = "n";
      key = "N";
      action = "Nzzzv";
      options = {
        desc = "Search next up, keep cursor center";
      };
    }

    #
    # Me
    #

    {
      mode = "n";
      key = "<leader>f";
      action = ":Oil<CR>";
      options = {
        desc = "open Oil";
      };
    }
    {
      mode = "n";
      key = "<C-f>";
      action = "<C-f>zz";
      options = {
        desc = "Page forward, keep cursor center";
      };
    }
    {
      mode = "n";
      key = "<PageDown>";
      action = "<cmd>echo 'Use Ctrl-f for page down'<CR>";
    }
    {
      mode = "n";
      key = "<C-b>";
      action = "<C-b>zz";
      options = {
        desc = "Page back, keep cursor center";
      };
    }
    {
      mode = "n";
      key = "<PageUp>";
      action = "<cmd>echo 'Use Ctrl-b for page up'<CR>";
    }

    #
    # https://github.com/JMartJonesy/kickstart.nixvim
    #

    {
      mode = "n";
      key = "<Esc>";
      action = "<cmd>nohlsearch<CR>";
      options = {
        desc = "No hlsearch";
      };
    }

    # TIP: Disable arrow keys in normal mode
    {
      mode = "n";
      key = "<left>";
      action = "<cmd>echo 'Use h to move left'<CR>";
    }
    {
      mode = "n";
      key = "<right>";
      action = "<cmd>echo 'Use l to move right'<CR>";
    }
    {
      mode = "n";
      key = "<up>";
      action = "<cmd>echo 'Use k to move up'<CR>";
    }
    {
      mode = "n";
      key = "<down>";
      action = "<cmd>echo 'Use j to move down'<CR>";
    }

    #  For split navigation use CTRL+<hjkl> to switch between windows
    #
    #  See `:help wincmd` for a list of all window commands
    {
      mode = "n";
      key = "<C-h>";
      action = "<C-w><C-h>";
      options = {
        desc = "Move focus to the window left";
      };
    }
    {
      mode = "n";
      key = "<C-l>";
      action = "<C-w><C-l>";
      options = {
        desc = "Move focus to the window right";
      };
    }
    {
      mode = "n";
      key = "<C-j>";
      action = "<C-w><C-j>";
      options = {
        desc = "Move focus to the window below";
      };
    }
    {
      mode = "n";
      key = "<C-k>";
      action = "<C-w><C-k>";
      options = {
        desc = "Move focus to the window above";
      };
    }
  ];
}
