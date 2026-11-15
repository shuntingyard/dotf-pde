{
  plugins.startify = {
    enable = true;

    settings = {
      custom_header = [
        ""
        "         ______"
        "        |      |.-----.--|  |.-----."
        "        |   ---||  _  |  _  ||  -__|"
        "        |___________________||_____|    __   __"
        "            |     __|  |--.--.--.-----.|  |_|__|.-----.-----."
        "            |__     |     |  |  |     ||   _|  ||     |  _  |"
        "         ___________|__|__|_____|_____||____|__||__|__|___  |"
        "        |    |  |__|.--.--.--.--.|__|.--------.       |_____|"
        "        |       |  ||_   _|  |  ||  ||        |"
        "        |__|____|__||__.__|\\___/ |__||__|__|__|"
      ];

      # When opening a file or bookmark, change to its directory.
      change_to_dir = false;

      # By default, the fortune header uses ASCII characters, because they work for everyone.
      # If you set this option to 1 and your 'encoding' is "utf-8", Unicode box-drawing characters will
      # be used instead.
      use_unicode = false;

      lists = [{ type = "dir"; }];
      files_number = 30;

      skiplist = [
        "flake.lock"
      ];
    };
  };
}
