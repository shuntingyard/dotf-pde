{
  plugins = {
    lsp = {
      enable = true;

      keymaps = {
        silent = true;
        diagnostic = {
          # Navigate in diagnostics (TODO: will we change these?)
          "<leader>k" = "goto_prev";
          "<leader>j" = "goto_next";
        };

        # TODO test the proper working of all these with Rust or Python.
        lspBuf = {
          "<leader>rn" = {
            action = "rename";
            desc = "[R]e[n]ame";
          };

          "<leader>ca" = {
            action = "code_action";
            desc = "[C]ode [A]ction";
          };

          gd = "definition";

          gi = "implementation";
          "<leader>D" = {
            action = "type_definition";
            desc = "Type [D]efinition";
          };

          gr = "references";

          K = "hover";

          gD = "declaration";
        };

        extra = [
          {
            key = "<leader>lf";
            # Allow formatting of parts of code under visual mark
            mode = [ "n" "v" ];
            # Starting with nu, we'll be using conform-nvim more and more...
            action = "<cmd>lua require('conform').format({ async = true, lsp_format = 'fallback' })<CR>";
            options.desc = "[L]SP [F]ormat";
          }
        ];
      };

      servers = {
        # LS we had before

        #ansiblels.enable = true; # Don't forget to `:set ft=yaml.ansible` !
        bashls.enable = true; # Shell scripting

        /*
        Clangd (C / C++). Enable background indexing and clang-tidy checks via cmd flags,
        and generate a compile_commands.json file
        (via CMake -DCMAKE_EXPORT_COMPILE_COMMANDS=ON or bear for Make projects)
        so header resolution works in Nix devShells:
        */
        clangd = {
          enable = true;
          cmd = [
            "clangd"
            "--background-index"
            "--clang-tidy"
            "--header-insertion=iwyu"
            "--completion-style=detailed"
          ];
        };

        #cssls.enable = true; # CSS
        #docker_compose_language_service.enable = true; # Docker yaml stuff
        #dockerls.enable = true; # dockerfile
        # go omitted for now
        #html.enable = true;
        #jsonls.enable = true; # JSON

        lua_ls.enable = true;

        # Markdown
        marksman.enable = true;

        # powershell omitted for now

        rust_analyzer = {
          enable = true;
          installCargo = false;
          installRustc = false;
        };

        # TODO should we give `semgrep` another go? (shehackspurple etc)

        #yamlls.enable = true; # YAML

        # New
        #texlab.enable = true; # LaTeX

        # Nix
        nixd = {
          enable = true;
          settings = {
            nixpkgs = { expr = "import <nixpkgs> { }"; };
            formatting = { command = [ "alejandra" ]; };
          };
        };

        # nu - the shell
        nushell.enable = true;

        # Python stuff
        ruff.enable = true;
        ty.enable = true;

        #sqls.enable = true; # https://github.com/sqls-server/sqls
      };
    };
  };
}
