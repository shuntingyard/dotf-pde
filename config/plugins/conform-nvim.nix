{ pkgs, ... }:
let
  topiary-nushell-src = pkgs.fetchFromGitHub {
    owner = "blindFS";
    repo = "topiary-nushell";
    rev = "b187defff76caaea7c95614047c1779a675df0f6";
    hash = "sha256-a9yWF75XPll2EYGE0LEDByFCcLUC+DmgfRToqTUNi60=";
  };

  nuGrammar = "${pkgs.vimPlugins.nvim-treesitter.builtGrammars.nu}/parser";

  # Create a patched languages.ncl pointing to Nix's prebuilt nu.so
  topiary-config = pkgs.runCommand "topiary-nushell-config" { } ''
    mkdir -p $out
    cp -r ${topiary-nushell-src}/queries $out/queries
    cat > $out/languages.ncl <<EOF
    {
      languages = {
        nu = {
          extensions = [ "nu" ],
          grammar.source.path = "${nuGrammar}",
        },
      },
    }
    EOF
  '';
in
{
  plugins.conform-nvim = {
    enable = true;
    settings = {
      /*
      format_on_save = {
        timeout_ms = 500;
        lsp_format = "fallback";
      };
      */
      formatters_by_ft = {
        nu = [ "topiary_nu" ];
      };
      formatters = {
        topiary_nu = {
          command = "topiary";
          args = [ "format" "--language" "nu" ];
          env = {
            TOPIARY_CONFIG_FILE = "${topiary-config}/languages.ncl";
            TOPIARY_LANGUAGE_DIR = "${topiary-config}/queries";
          };
        };
      };
    };
  };
}
