{
  # TS requires this
  plugins.web-devicons.enable = true;

  plugins.telescope = {
    enable = true;
    extensions.fzf-native.enable = true;

    keymaps = {
      /*
      Setting `<Key> = { options.desc = "some description"; ... };`
      looks like bad practice, as Telescope generates concise
      descriptions on its own.
      */

      # TODO  check later for availability of Telescope's Themes extension
      #
      #         <https://github.com/andrewberty/telescope-themes>
      #
      #       as we were using `dropdown` before. lf

      "<leader>gf" = {
        action = "git_files";
      };
      "<leader>sf" = {
        action = "find_files";
      };
      "<leader>sh" = {
        action = "help_tags";
      };
      "<leader>sw" = {
        action = "grep_string";
      };
      "<leader>sg" = {
        action = "live_grep";
      };
      "<leader>sd" = {
        action = "diagnostics";
      };
      "<leader><space>" = {
        action = "buffers";
      };
      "<leader>?" = {
        action = "oldfiles";
      };
    };

    settings.defaults = {
      file_ignore_patterns = [
        "^.git/"
        "^.mypy_cache/"
        "^__pycache__/"
        "^output/"
        "^data/"
        "%.ipynb"
      ];
      set_env.COLORTERM = "truecolor";
    };
  };
}
