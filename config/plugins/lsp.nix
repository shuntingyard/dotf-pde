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
          "<leader>lf" = {
            # action.__raw = "vim.lsp.buf.format({ timeout_ms = 5000 })";
            action = "format";
            desc = "[L]SP [F]ormat";
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
      };

      servers = {
        # LS we had before
        #ansiblels.enable = true; # Do we still need to `:set ft=yaml.ansible`?
        #bashls.enable = true; # shell scripting
        #clangd.enable = true; # c, cpp
        #cssls.enable = true; # CSS
        #docker_compose_language_service.enable = true; # Docker yaml stuff
        #dockerls.enable = true; # dockerfile
        # go omitted for now
        #html.enable = true;
        #jsonls.enable = true; # JSON
        lua_ls.enable = true;
        marksman.enable = true; # markdown
        # powershell omitted for now
        # pyright omitted!
        rust_analyzer = {
          enable = true;
          installCargo = false;
          installRustc = false;
        };
        # sqlls abandoned in favor of sqls
        # TODO should we give `semgrep` another go? (shehackspurple etc)
        #yamlls.enable = true; # YAML

        # New
        #texlab.enable = true; # LaTeX
        nixd = {
          enable = true;
          extraOptions = {
            nixpkgs = { expr = "import <nixpkgs> { }"; };
            formatting = { command = "alejandra"; };
          };
        };
        #pylyzer.enable = true; # TODO decide whether to keep!
        #ruff.enable = true; # lint and format Python
        #sqls.enable = true; # https://github.com/sqls-server/sqls
      };
    };
  };
}
