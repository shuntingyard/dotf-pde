{ config
, lib
, pkgs
, ...
}:
with lib; let
  cfg = config.personalized.nvim.hm;
in
{
  options = {
    personalized.nvim.hm = {
      enable = mkEnableOption "Enable the home-manager module";

      colorscheme = lib.mkOption {
        type = lib.types.str;
        default = "sonokai";
        description = lib.mdDoc "Set colorscheme (default is sonokai)";
      };

      throttleRustAnalyzer = lib.mkOption {
        type = lib.types.bool;
        default = false;
        description = lib.mdDoc "Configure rust-analyzer for modest hardware";
      };
    };
  };

  config = mkIf cfg.enable {
    programs.nixvim = {
      enable = true;
      imports = [
        ../config
      ];

      # Make default availabe
      extraPlugins = [
        pkgs.vimPlugins.sonokai
      ];
      colorscheme = "${cfg.colorscheme}";

      # Make rust-analyzer less resource hungry on request
      plugins.lsp.servers.rust_analyzer.settings.rust_analyzer =
        if cfg.throttleRustAnalyzer then {

          # Severe Throttling for low-RAM systems (WSL2 fixes)
          numThreads = 2;
          workspace.support.binary.modules = false;
          diagnostics.experimental.enable = false;
          cachePriming.enable = false;
          checkOnSave = false; # Turn off save checks to eliminate target folder thrashing

        } else {
          # Leave things as configured elsewhere};
        };
    };
  };
}
